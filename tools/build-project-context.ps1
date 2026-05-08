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

function Get-NormalizedAgentBody {
    param([string]$Path)

    $projRelative = Resolve-Path -LiteralPath $Path | ForEach-Object {
        $_.Path.Substring($proj.Length).TrimStart('\')
    }

    $content = Get-ExportContent -SourcePath $Path -RelativeSource $projRelative
    return ($content -replace "`r`n", "`n").TrimEnd()
}

function Assert-AgentVariantBodiesMatch {
    $agentsDir = Join-Path $proj '.github/agents'
    if (-not (Test-Path $agentsDir)) {
        return
    }

    $candidateErrors = @()
    $variantMismatches = @()
    $variantErrors = @()
    $agentFiles = Get-ChildItem -Path $agentsDir -Filter '*.agent.md' -File

    foreach ($file in $agentFiles) {
        if ($file.BaseName -notmatch '^(?<role>.+)-(?<variant>[^-]+)\.agent$') {
            continue
        }

        $roleName = $Matches['role']
        $variantName = $Matches['variant']
        if ($variantName -eq 'candidate') {
            if (-not (Test-AgentFrontmatterFlag -Path $file.FullName -FlagName 'candidate' -ExpectedValue 'true')) {
                $candidateErrors += "$($file.Name): candidate role files must carry candidate: true in frontmatter"
            }
            $candidateErrors += "$($file.Name): candidate roles must not exist at build time"
            continue
        }

        $basePath = Join-Path $agentsDir ($roleName + '.agent.md')
        if (-not (Test-Path $basePath)) {
            $variantErrors += "$($file.Name): missing maintained base role $roleName.agent.md"
            continue
        }

        $variantBody = Get-NormalizedAgentBody -Path $file.FullName
        $baseBody = Get-NormalizedAgentBody -Path $basePath
        if ($variantBody -ne $baseBody) {
            $variantMismatches += "$($file.Name) does not match $roleName.agent.md after frontmatter is stripped"
        }
    }

    if ($candidateErrors.Count -gt 0 -or $variantErrors.Count -gt 0 -or $variantMismatches.Count -gt 0) {
        $details = @($candidateErrors + $variantErrors + $variantMismatches) -join [Environment]::NewLine
        Write-Error "Agent variant body check failed:$([Environment]::NewLine)$details"
        exit 1
    }
}

$packageFiles = Read-ListFile $manifest | ForEach-Object { Parse-ManifestEntry $_ }
$extraFiles = Read-ListFile $distExtras

Assert-AgentVariantBodiesMatch

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