# Tiinex — AI — Inference Lab

Canonical GitHub repo: https://github.com/Tiinex/ai

This repository is a lightweight scaffold for preserving judgment, context, and handoff quality across chats, tools, and collaborators.

It is meant to stay usable by humans first. The root should help a person understand the package quickly, not hide the logic that makes the roles work.

The goal is not to ship a giant all-in-one system. The goal is to keep a small core that can be used immediately, extended carefully, and handed to someone else without losing the signal that matters.

## Start Here

- If you want the lightest human handoff, start with `.github/templates/handoff-intro-message-v1.md`.
- If you need the heavier transfer scaffold, open `.github/templates/anchor-inference-transfer-template-v1.md` next.
- If you want to inspect the maintained role sources directly, go to `.github/agents/`.
- If you want to understand how cloud behavior is tested and kept in sync, read `.github/skills/chatgpt-cloud-project-testing/`.

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

## What This Repo Is Not

- not a giant framework that must be understood all at once
- not a root-driven control system where README or other root files secretly make the roles behave correctly
- not separate local and cloud personalities for the same role

## Repo Shape

- The repo root is intentionally small. It should work as a map for a human reader, not as a hidden dependency for role behavior.
- `.github/agents/` holds the maintained role definitions.
- `.github/skills/` holds workflow-specific operational artifacts.
- `.github/shared/` holds shared canon and governance that should not live only in a role.
- `.github/cloud/` holds bootstrap and cloud-facing support material.
- `.github/transitions/` holds temporary carry-surfaces that are still being distilled into better long-term homes.
- `.github/templates/` holds small handoff artifacts that sit close to real transfer.

The repo is the primary local workspace. The cloud package is a derived export, not a separate second product.

## Role Model

- Each role has one primary identity, not separate VS Code and ChatGPT Cloud personalities.
- VS Code and ChatGPT Cloud are different execution surfaces for the same maintained role signal.
- Roles must still function without needing root-file guidance.
- Platform-specific behavior should live in workflow skills, bootstrap text, packaging, and validation rather than in duplicate role identities or hidden root logic.
- `.github/agents/` is the primary source of truth for the role definitions.
- Agent files should stay close to real role signal and should not be duplicated in root only for packaging convenience.
- The role texts should remain platform-agnostic; storing them in `.github/agents/` is a local tooling detail, not part of their identity.
- When present, `human-role: true` is descriptive frontmatter only: it marks a role a human can also carry and signals human provenance behind the role shape, but it does not define runtime behavior or tool policy by itself.
- `Anchor` is kept as a single portable source so the same file can work locally, in transfer, and in cloud without creating duplicate truth.
- Human review remains the coordination authority. Roles may diagnose, draft, and recommend, but a human owner decides canon changes, manifest broadening, live `Instructions` changes, and release sign-off.
- In practice, role feedback should be weighed by relevance to the current question, and the human can re-steer at any point with a short steering message that resets priority, scope, or caution level.

## Language Policy

- Shared, reusable, public-facing artifacts should move toward English by default.
- Roles should answer people in the language the person is currently using unless asked otherwise.
- Language-specific source material may remain language-bound when forced translation would lose signal.
- Full translation of inference-bearing files should be deliberate and traceable, not a blind sweep.

## Transfer And Support Surfaces

- `.github/templates/handoff-intro-message-v1.md` is the lowest-friction intro for a new collaborator.
- `.github/templates/anchor-inference-transfer-template-v1.md` is the heavier inference-transfer scaffold.
- `.github/templates/operational-addendum-template-v1.md` is the small addendum for moving from scaffold to concrete work.
- `.github/transitions/RECOVERY_INSTRUCTIONS.md` is the active non-canonical continuity payload when a small state-carry surface is still justified.
- `.github/transitions/TRANSFER_AND_PROCESS.md` carries persistence governance, feedback-loop discipline, drift patterns, and transfer thresholds while that process signal is still being distilled.

## Curated Cloud Context

The cloud package is intentionally curated to restore the right working context, not to mirror the repository word for word.

- `.github/cloud/BOOTSTRAP_MIN.md` carries startup weighting and prune rules.
- `.github/shared/TEAM_DYNAMICS.md` maps the roles and how they interact.
- Role notes are exported from `.github/agents/` into short cloud-facing names such as `ECHO.md`, `KODAX.md`, `SIGMA.md`, `LEO.md`, and `ORBIT.md`.
- `.github/shared/PROJECT_CORE.md` carries the stable project core.
- `.github/shared/DECISION_WEIGHTS.md` carries weighting rules under uncertainty.
- `.github/shared/PIPELINE.md` carries phase logic and work shifts.
- `.github/transitions/RECOVERY_INSTRUCTIONS.md` carries the active non-canonical recovery payload that should survive compact, reset, or handoff until it has a better long-term home.
- `.github/transitions/TRANSFER_AND_PROCESS.md` carries the process truths that still need a transition surface.
- `.github/templates/anchor-inference-transfer-template-v1.md` and the other templates provide compact transfer help when a human handoff artifact is needed.

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
- In practical cloud use, the first message should carry both role signal and a simple task hint. `Hi Echo` may be enough for role selection, but it is too thin for reliable zip reading. A better minimum is `Hi Echo, use the zip as project context`.

## Real ChatGPT Project Use

`.github/cloud/CLOUD_CHAT_GPT_PROJECT_ECHO_PRE_PROMPT.md` is kept locally and copied into `dist/` for easy cloud access.

Important for real ChatGPT Project use:

- The project's live `Instructions` in `Project settings` are a separate control surface from the uploaded zip.
- When `.github/cloud/CLOUD_CHAT_GPT_PROJECT_ECHO_PRE_PROMPT.md` changes, the live `Instructions` surface must be resynced explicitly or cloud behavior may continue to follow stale bootstrap text.
- For language-following on the first substantive cloud turn, the current user message language should outrank the language of the bootstrap text itself, any project-default language, and any earlier dominant thread language. If a fresh English turn answers in Swedish while concrete file reading still passes, suspect bootstrap or live `Instructions` weighting before blaming the role.
- If the preview surface is logged out or auth-gated, cloud testing should stop until the user signs in.
- If the intended project is missing or no longer a safe test surface, prefer a fresh dedicated project over forcing ambiguous cleanup in the wrong one.

## Workflow Skills

- `.github/skills/chatgpt-cloud-project-testing/` carries the cloud testing workflow as separate process signal.
- The cloud test method lives there deliberately instead of inside Echo or Anchor.
- The role should carry inferential discipline; the skill should carry the operational testing sequence.
- `.github/skills/chatgpt-cloud-project-testing/assets/live-sync-checklist.md` is the concrete sync routine for zip, live `Instructions`, and chat state.
- `.github/skills/vscode-decision-questions/` is the VS Code-specific workflow for using `vscode_askQuestions` when a few bounded decisions are faster and safer than freeform chat.
