# Inference Lab — Human + AI

This repository is a lightweight, human-facing scaffold for turning hard-won understanding into durable artifacts.

In practical terms, it is a small set of templates, role definitions, and workflow notes for preserving project context and handoff quality across VS Code and ChatGPT Projects.

It is meant to be useful not only for developers, but for anyone who wants steadier collaboration with AI: writers, researchers, founders, operators, collaborators, or people simply trying to preserve hard-won understanding across chats, tools, and handoffs.

The goal is not to ship a giant all-in-one system. The goal is to keep a small core that can be used immediately, extended carefully, and handed to someone else without losing the signal that matters.

## Start Here

- If you want the fastest first pass, start with `templates/handoff-intro-message-v1.md`.
- If you need the heavier transfer scaffold, open `templates/anchor-inference-transfer-template-v1.md` next.
- If you want to understand how the cloud side is tested and kept in sync, read `.github/skills/chatgpt-cloud-project-testing/` after that.

## What This Repo Helps With

- preserving signal across chats, tools, and handoffs
- onboarding a new person without starting from zero
- keeping canon, process, meta, and temporary work from collapsing into each other
- testing collaboration behavior locally in VS Code and in real ChatGPT Projects
- packaging a curated cloud context instead of dumping the entire repo

## Who This Is For

- people externalizing judgment, taste, process, or continuity into artifacts
- teams that want lightweight shared context instead of heavyweight documentation
- anyone who wants AI collaboration to stay readable, portable, and adjustable

## Current Core

- `templates/anchor-inference-transfer-template-v1.md` is the core scaffold for inference transfer.
- `templates/handoff-intro-message-v1.md` is the low-friction intro for a new collaborator.
- `templates/operational-addendum-template-v1.md` is the minimal addendum for real work once concrete context exists.
- `.github/agents/` is the local VS Code surface for maintained role definitions.
- `.github/skills/` contains workflow artifacts such as real ChatGPT Cloud Project testing.

The repo is the primary local workspace. The cloud package is a derived export, not a separate second product.

## Control Model

- Each role has one primary identity, not separate VS Code and ChatGPT Cloud personalities.
- VS Code and ChatGPT Cloud are different execution surfaces for the same maintained role signal.
- Platform-specific behavior should live in workflow skills, bootstrap text, packaging, and validation rather than in duplicate role identities.
- Human review remains the coordination authority. Roles may diagnose, draft, and recommend, but a human owner decides canon changes, manifest broadening, live `Instructions` changes, and release sign-off.
- In practice, role feedback should be weighed by relevance to the current question, and the human can re-steer at any point with a short steering message that resets priority, scope, or caution level.

## Language Policy

- Shared, reusable, public-facing artifacts should move toward English by default.
- Roles should answer people in the language the person is currently using unless asked otherwise.
- Language-specific source material may remain language-bound when forced translation would lose signal.
- Full translation of inference-bearing files should be deliberate and traceable, not a blind sweep.

## Curated Cloud Context

The cloud package is intentionally curated to restore the right working context, not to mirror the repository word for word.

- `BOOTSTRAP_MIN.md` carries startup weighting and prune rules.
- `TEAM_DYNAMICS.md` maps the roles and how they interact.
- Role notes are exported from `.github/agents/` into short cloud-facing names such as `ECHO.md`, `SIGMA.md`, `LEO.md`, and `ORBIT.md`.
- `PROJECT_CORE.md` carries the stable project core.
- `DECISION_WEIGHTS.md` carries weighting rules under uncertainty.
- `PIPELINE.md` carries phase logic and work shifts.
- `TRANSFER_AND_PROCESS.md` carries meta-calibration, lessons, and operating sequence.
- `templates/anchor-inference-transfer-template-v1.md` helps Echo rehydrate the right reading.
- `templates/handoff-intro-message-v1.md` is reusable as a manual low-friction intro.
- `templates/operational-addendum-template-v1.md` sharpens cloud context when more concrete work context is needed.

If Anchor surfaces that other signal carriers may be needed, the manifest should be changed explicitly through human review rather than silently broadening the package.

## Packaging

- The single zip export manifest lives in `tools/project-context.manifest.txt`.
- Extra files that should sit beside the zip in `dist/` are listed in `tools/project-context.dist-extras.txt`.
- Run `powershell -ExecutionPolicy Bypass -File .\tools\build-project-context.ps1` to build `dist/PROJECT_CONTEXT.zip`.
- Use `-KeepStaging` only when you explicitly want to inspect the staging directory temporarily.
- The zip is flattened for cloud use; directory structure is encoded in file-name prefixes.
- Exported role notes strip agent frontmatter and become plain markdown files in the zip.
- By default, `dist/` should only contain `PROJECT_CONTEXT.zip`, `CLOUD_CHAT_GPT_PROJECT_ECHO_PRE_PROMPT.md`, and explicitly listed extras.
- The default rule is one zip for text and inference carriers. If more upload slots are used, reserve them primarily for standalone images that the destination can actually index.
- In practical cloud use, the first message should carry both role signal and a simple task hint. `Hej Echo` may be enough for role selection, but it is too thin for reliable zip reading. A better minimum is `Hej Echo, use the zip as project context`.

## Real ChatGPT Project Use

`CLOUD_CHAT_GPT_PROJECT_ECHO_PRE_PROMPT.md` is kept locally and copied into `dist/` for easy cloud access.

Important for real ChatGPT Project use:

- The project's live `Instructions` in `Project settings` are a separate control surface from the uploaded zip.
- When `CLOUD_CHAT_GPT_PROJECT_ECHO_PRE_PROMPT.md` changes, the live `Instructions` surface must be resynced explicitly or cloud behavior may continue to follow stale bootstrap text.
- For language-following on the first substantive cloud turn, the current user message language should outrank the language of the bootstrap text itself, any project-default language, and any earlier dominant thread language. If a fresh English turn answers in Swedish while concrete file reading still passes, suspect bootstrap or live `Instructions` weighting before blaming the role.
- If the preview surface is logged out or auth-gated, cloud testing should stop until the user signs in.
- If the intended project is missing or no longer a safe test surface, prefer a fresh dedicated project over forcing ambiguous cleanup in the wrong one.

## Local Agent Surface

- `.github/agents/` is the primary source of truth for the role definitions.
- The cloud build derives the role notes for `PROJECT_CONTEXT.zip` from those agent files.
- Agent files should stay close to real role signal and should not be duplicated in root only for packaging convenience.
- The role texts should remain platform-agnostic; storing them in `.github/agents/` is a local tooling detail, not part of their identity.
- `Anchor` is kept as a single portable source so the same file can work locally, in transfer, and in cloud without creating duplicate truth.

## Workflow Skills

- `.github/skills/chatgpt-cloud-project-testing/` carries the cloud testing workflow as separate process signal.
- The cloud test method lives there deliberately instead of inside Echo or Anchor.
- The role should carry inferential discipline; the skill should carry the operational testing sequence.
- `.github/skills/chatgpt-cloud-project-testing/assets/live-sync-checklist.md` is the concrete sync routine for zip, live `Instructions`, and chat state.
- `.github/skills/vscode-decision-questions/` is the VS Code-specific workflow for using `vscode_askQuestions` when a few bounded decisions are faster and safer than freeform chat.

## Delivery Support

- `templates/README.md` explains which templates are the safest entry points and which ones remain language-bound on purpose.
- `templates/anchor-inference-transfer-template-v1.md` is the core inference-transfer scaffold.
- `templates/handoff-intro-message-v1.md` is the low-friction intro for a new collaborator.
- `templates/operational-addendum-template-v1.md` is the minimal addendum for moving from scaffold to concrete work.
