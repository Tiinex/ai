param(
    [switch]$KeepStaging
)

$ErrorActionPreference = 'Stop'

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$proj = Split-Path -Parent $scriptDir
$dist = Join-Path $proj 'dist'
$staging = Join-Path $dist 'PROJECT_CONTEXT'
$zipfile = Join-Path $dist 'PROJECT_CONTEXT.zip'
$manifest = Join-Path $proj 'tools/project-context.manifest.txt'
$distExtras = Join-Path $proj 'tools/project-context.dist-extras.txt'
$prePrompt = Join-Path $proj '.github/cloud/CLOUD_CHAT_GPT_PROJECT_ECHO_PRE_PROMPT.md'

function Read-ListFile {
    param([string]$Path)

    if (-not (Test-Path $Path)) {
        Write-Error "Missing list file: $Path"
        exit 1
    }

    return Get-Content $Path | ForEach-Object { $_.Trim() } | Where-Object { $_ -and -not $_.StartsWith('#') }
}

function Parse-ManifestEntry {
    param([string]$Entry)

    $parts = $Entry.Split('|', 2)
    $source = $parts[0].Trim()
    $destination = if ($parts.Count -gt 1 -and $parts[1].Trim()) { $parts[1].Trim() } else { $source }

    return [pscustomobject]@{
        Source = $source
        Destination = $destination
    }
}

function Convert-ToFlatFileName {
    param([string]$RelativePath)

    $normalized = $RelativePath.Replace('\\', '/').TrimStart('./')
    return $normalized.Replace('/', '__')
}

function Get-ExportContent {
    param(
        [string]$SourcePath,
        [string]$RelativeSource
    )

    $content = Get-Content -Path $SourcePath -Raw
    if ($RelativeSource -like '*.agent.md' -and $content.StartsWith("---")) {
        $content = [regex]::Replace($content, '^---\r?\n.*?\r?\n---\r?\n?', '', 'Singleline')
    }

    return $content
}

function Test-AgentFrontmatterFlag {
    param(
        [string]$Path,
        [string]$FlagName,
        [string]$ExpectedValue
    )

    $content = Get-Content -Path $Path -Raw
    if (-not $content.StartsWith('---')) {
        return $false
    }

    $frontmatterMatch = [regex]::Match($content, '^---\r?\n(.*?)\r?\n---\r?\n?', 'Singleline')
    if (-not $frontmatterMatch.Success) {
        return $false
    }

    $pattern = '(?m)^' + [regex]::Escape($FlagName) + '\s*:\s*' + [regex]::Escape($ExpectedValue) + '\s*$'
    return [regex]::IsMatch($frontmatterMatch.Groups[1].Value, $pattern)
}

function Test-AgentFrontmatterKey {
    param(
        [string]$Path,
        [string]$KeyName
    )

    $content = Get-Content -Path $Path -Raw
    if (-not $content.StartsWith('---')) {
        return $false
    }

    $frontmatterMatch = [regex]::Match($content, '^---\r?\n(.*?)\r?\n---\r?\n?', 'Singleline')
    if (-not $frontmatterMatch.Success) {
        return $false
    }

    $pattern = '(?m)^' + [regex]::Escape($KeyName) + '\s*:'
    return [regex]::IsMatch($frontmatterMatch.Groups[1].Value, $pattern)
}

function Get-NormalizedAgentBody {
    param([string]$Path)

    $projRelative = Resolve-Path -LiteralPath $Path | ForEach-Object {
        $_.Path.Substring($proj.Length).TrimStart('\')
    }

    $content = Get-ExportContent -SourcePath $Path -RelativeSource $projRelative
    return ($content -replace "`r`n", "`n").TrimEnd()
}

function Get-AgentVariantInfo {
    param([System.IO.FileInfo]$File)

    if (-not $File.Name.EndsWith('.agent.md')) {
        return $null
    }

    $stem = $File.Name.Substring(0, $File.Name.Length - '.agent.md'.Length)
    $tokens = $stem.Split('.')
    if ($tokens.Count -lt 1) {
        return $null
    }

    $roleName = $tokens[0]
    $remainingTokens = if ($tokens.Count -gt 1) { $tokens[1..($tokens.Count - 1)] } else { @() }
    $lifecycle = $null

    if ($remainingTokens.Count -gt 0 -and @('candidate', 'experimental') -contains $remainingTokens[-1]) {
        $lifecycle = $remainingTokens[-1]
        $remainingTokens = if ($remainingTokens.Count -gt 1) { $remainingTokens[0..($remainingTokens.Count - 2)] } else { @() }
    }

    return [pscustomobject]@{
        File = $File
        RoleName = $roleName
        Lifecycle = $lifecycle
        IsCandidate = $lifecycle -eq 'candidate'
        VariantKey = @($remainingTokens) -join '.'
        HasExplicitVariant = $tokens.Count -gt 1
    }
}

function Assert-AgentVariantBodiesMatch {
    $agentsDir = Join-Path $proj '.github/agents'
    if (-not (Test-Path $agentsDir)) {
        return
    }

    $candidateErrors = @()
    $toolsErrors = @()
    $variantMismatches = @()
    $agentInfos = Get-ChildItem -Path $agentsDir -Filter '*.agent.md' -File |
        ForEach-Object { Get-AgentVariantInfo -File $_ } |
        Where-Object { $null -ne $_ }

    foreach ($info in $agentInfos) {
        if (-not (Test-AgentFrontmatterKey -Path $info.File.FullName -KeyName 'tools')) {
            $toolsErrors += "$($info.File.Name): role files must carry explicit tools frontmatter"
        }
    }

    foreach ($info in $agentInfos | Where-Object { $_.IsCandidate }) {
        if (-not (Test-AgentFrontmatterFlag -Path $info.File.FullName -FlagName 'candidate' -ExpectedValue 'true')) {
            $candidateErrors += "$($info.File.Name): candidate role files must carry candidate: true in frontmatter"
        }
    }

    foreach ($group in ($agentInfos | Where-Object { -not $_.IsCandidate } | Group-Object RoleName)) {
        $roleInfos = @($group.Group | Sort-Object { $_.File.Name })
        if ($roleInfos.Count -le 1) {
            continue
        }

        $baseline = $roleInfos | Where-Object { -not $_.HasExplicitVariant } | Select-Object -First 1
        if ($null -eq $baseline) {
            $baseline = $roleInfos[0]
        }

        $baselineBody = Get-NormalizedAgentBody -Path $baseline.File.FullName
        foreach ($info in $roleInfos) {
            if ($info.File.FullName -eq $baseline.File.FullName) {
                continue
            }

            $variantBody = Get-NormalizedAgentBody -Path $info.File.FullName
            if ($variantBody -ne $baselineBody) {
                $variantMismatches += "$($info.File.Name) does not match $($baseline.File.Name) after frontmatter is stripped"
            }
        }
    }

    if ($toolsErrors.Count -gt 0 -or $candidateErrors.Count -gt 0 -or $variantMismatches.Count -gt 0) {
        $details = @($toolsErrors + $candidateErrors + $variantMismatches) -join [Environment]::NewLine
        Write-Error "Agent variant body check failed:$([Environment]::NewLine)$details"
        exit 1
    }
}

function Assert-ManifestExcludesCandidateAgents {
    param([object[]]$ManifestEntries)

    $candidateExportErrors = @()

    foreach ($entry in $ManifestEntries) {
        if ($entry.Source -notlike '*.agent.md') {
            continue
        }

        $sourcePath = Join-Path $proj $entry.Source
        if (-not (Test-Path $sourcePath)) {
            continue
        }

        if (Test-AgentFrontmatterFlag -Path $sourcePath -FlagName 'candidate' -ExpectedValue 'true') {
            $candidateExportErrors += "$($entry.Source): candidate role files must not be exported in PROJECT_CONTEXT.zip"
        }
    }

    if ($candidateExportErrors.Count -gt 0) {
        $details = $candidateExportErrors -join [Environment]::NewLine
        Write-Error "Project context manifest includes candidate role files:$([Environment]::NewLine)$details"
        exit 1
    }
}

$packageFiles = Read-ListFile $manifest | ForEach-Object { Parse-ManifestEntry $_ }
$extraFiles = Read-ListFile $distExtras

Assert-AgentVariantBodiesMatch
Assert-ManifestExcludesCandidateAgents -ManifestEntries $packageFiles

if (-not (Test-Path $dist)) {
    New-Item -ItemType Directory -Path $dist | Out-Null
}

foreach ($legacyPath in @(
    (Join-Path $dist 'COLLABORATION_SCAFFOLD_TEMPLATE'),
    (Join-Path $dist 'COLLABORATION_SCAFFOLD_TEMPLATE.zip'),
    (Join-Path $dist 'INTERNAL_MODEL_PROJECT_CONTEXT'),
    (Join-Path $dist 'INTERNAL_MODEL_PROJECT_CONTEXT.zip')
)) {
    if (Test-Path $legacyPath) {
        Remove-Item $legacyPath -Recurse -Force
    }
}

if (Test-Path $staging) {
    Remove-Item $staging -Recurse -Force
}
New-Item -ItemType Directory -Path $staging | Out-Null

foreach ($file in $packageFiles) {
    $sourcePath = Join-Path $proj $file.Source
    if (-not (Test-Path $sourcePath)) {
        Write-Error "Missing project context file: $($file.Source)"
        exit 1
    }

    $destPath = Join-Path $staging (Convert-ToFlatFileName $file.Destination)
    $content = Get-ExportContent -SourcePath $sourcePath -RelativeSource $file.Source
    Set-Content -Path $destPath -Value $content -NoNewline
}

if (Test-Path $prePrompt) {
    Copy-Item -Path $prePrompt -Destination $dist -Force
}

foreach ($file in $extraFiles) {
    $sourcePath = Join-Path $proj $file
    if (-not (Test-Path $sourcePath)) {
        Write-Error "Missing dist extra file: $file"
        exit 1
    }

    $leafName = Split-Path $file -Leaf
    $destPath = Join-Path $dist $leafName
    if ((Test-Path $destPath) -and ((Resolve-Path $sourcePath).Path -ne (Resolve-Path $destPath).Path)) {
        Write-Error "Dist extra name collision: $leafName"
        exit 1
    }

    Copy-Item -Path $sourcePath -Destination $destPath -Force
}

if (Test-Path $zipfile) {
    Remove-Item $zipfile -Force
}
Compress-Archive -Path (Join-Path $staging '*') -DestinationPath $zipfile
if (-not $KeepStaging) {
    Remove-Item $staging -Recurse -Force
}

Write-Host "Created project context zip package at $zipfile"
if ($KeepStaging) {
    Write-Host "Project context staging retained at $staging"
}

Write-Host "Files included in zip: $($packageFiles.Count)"
Write-Host "Standalone dist extras copied: $($extraFiles.Count + [int](Test-Path $prePrompt))"