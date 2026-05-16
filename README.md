# Tiinex — AI — Inference Lab

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)

Canonical GitHub repo: https://github.com/Tiinex/ai

This repository is a lightweight scaffold for preserving judgment, context, and handoff quality across chats, tools, and collaborators.

It is meant to stay usable by humans first. The root should help a person understand the package quickly, not hide the logic that makes the roles work.

The goal is not to ship a giant all-in-one system. The goal is to keep a small core that can be used immediately, extended carefully, and handed to someone else without losing the signal that matters.

## Start Here

- If you want the lightest human handoff, start with `.github/templates/handoff-intro-message-v1.md`.
- If you need the heavier transfer scaffold, open `.github/templates/anchor-inference-transfer-template-v1.md` next.
- If you want to inspect the role sources and explicit variants directly, go to `.github/agents/`.
- If you want to understand how cloud behavior is tested and kept in sync, read `.github/skills/chatgpt-cloud-project-testing/`.

## VS Code Setup

- This repo recommends the published `Tiinex — AI — VS Code — Tools` extension through `.vscode/extensions.json` for people who clone the repo and want the companion Local chat tooling.
- If you are developing Tiinex extensions locally, do not rely on a packaged install as the default iteration path.
- For local extension development, prefer a repo-linked dev path or an Extension Development Host so reloads target the repo copy you are editing.
- On Windows, the current repo-local bootstrap for `ai-vscode-tools` is `ai-vscode-tools/scripts/ensure-windows-main-host-dev-extension-link.ps1`.
- The companion YouTube repo keeps the same pattern under `youtube/vscode-extension/scripts/ensure-windows-main-host-dev-extension-link.ps1`.

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
- `.github/agents/` holds the active role definitions and explicit model/lifecycle variants.
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
- `.github/agents/` is the primary local source tree for role definitions and explicit role variants.
- Agent files should stay close to real role signal and should not be duplicated in root only for packaging convenience.
- The role texts should remain platform-agnostic; storing them in `.github/agents/` is a local tooling detail, not part of their identity.
- When present, `human-role: true` is descriptive frontmatter only: it marks a role a human can also carry and signals human provenance behind the role shape, but it does not define runtime behavior or tool policy by itself.
- Anchor's role signal should remain portable across local, transfer, and cloud even when the repo carries explicit model-bound or lifecycle-specific surfaces for testing and transparency.
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
- `.github/transitions/ROLE_DEVELOPMENT_LOOP.md` is the primary transition artifact for role-development process while that discipline is still being anchored into better long-term homes.
- `.github/transitions/TRANSFER_AND_PROCESS.md` carries persistence governance, feedback-loop discipline, drift patterns, and transfer thresholds while that process signal is still being distilled.

## Curated Cloud Context

The cloud package is intentionally curated to restore the right working context, not to mirror the repository word for word.

- `.github/cloud/BOOTSTRAP_MIN.md` carries startup weighting and prune rules.
- `.github/shared/TEAM_DYNAMICS.md` maps the roles and how they interact.
- Selected role notes are exported from `.github/agents/` into short cloud-facing names such as `ANCHOR.md`, `ECHO.md`, `KODAX.md`, `SIGMA.md`, `LEO.md`, and `ORBIT.md`.
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

## Low-Drift Setup

This repo works best when continuity is explicit, scoped, and recoverable rather than hidden in personalization or thread carry-over.

Preferred defaults:

- explicit artifacts over hidden personalization
- scoped continuity over endless thread continuation
- observable state over behavioral accumulation
- re-grounding from repo artifacts over relying on old chat momentum

### GitHub Copilot

GitHub-side setup:

1. Open GitHub Copilot settings at `https://github.com/settings/copilot`.
2. Look for options related to:
	- Memory
	- Repository memory
	- Cross-session memory
	- Personalized responses
	- Context retention
	- or similar adaptive behavior
3. Disable anything that stores preferences, remembers repositories, or offers improved future responses through retained personalization.
4. If your account or plan does not expose those controls, use the behavioral fallback: treat GitHub-side continuity as non-authoritative and re-ground from repo artifacts instead of relying on remembered state.

VS Code-side setup:

1. Open the command palette with `Ctrl+Shift+P`.
2. Run `Preferences: Open Settings (JSON)`.
3. If your build exposes memory-style toggles, disable them there.

Common examples that may exist on some builds:

```json
{
	"github.copilot.chat.tools.memory.enabled": false,
	"github.copilot.chat.copilotMemory.enabled": false,
	"github.copilot.chat.summarizeAgentConversationHistory.enabled": false,
	"github.copilot.chat.edits.temporalContext.enabled": false
}
```

Optional search-behavior reduction in VS Code:

```json
{
	"search.searchView.semanticSearchBehavior": "manual",
	"search.searchView.keywordSuggestions": false
}
```

If your build does not expose these exact keys, follow the behavioral rule instead: prefer explicit artifact reads over adaptive memory or implicit carry-over.

### ChatGPT

Memory settings:

1. Open `Profile Icon -> Settings -> Personalization -> Memory`.
2. Disable `Memory`.
3. Disable `Reference saved memories`.
4. Disable `Reference chat history`.
5. Check `Manage memories` and delete any saved memories that should not persist.

Data-use setting:

1. Open `Settings -> Data Controls`.
2. Disable `Improve the model for everyone`.
3. OpenAI states that when this is off, new ChatGPT conversations remain in chat history but are not used to train ChatGPT.
4. Treat this as part of the default low-drift setup, not as an optional extra.

Feedback hygiene:

1. Avoid using feedback interactions such as thumbs up, thumbs down, side-by-side option choices, rating prompts, or inline feedback requests for sensitive work.
2. OpenAI states that even if model training is turned off, if you choose to provide feedback, the entire conversation associated with that feedback may be used to train models.
3. For sensitive work, prefer closing or ignoring feedback prompts instead of selecting an option.

Temporary Chat:

1. Use `Temporary Chat` when you want a lower-persistence interaction.
2. OpenAI states that Temporary Chats do not appear in history, do not use or create memories, and are not used to train models.
3. This does not replace careful handling of sensitive information, but it is a safer default for exploratory or higher-risk conversations.

Re-entry model:

1. For important work, do not rely on platform memory as the source of truth.
2. Prefer repository files, explicit context exports, README or NOTICE files, pinned operational instructions, and reviewed handoff artifacts.

Why this is recommended here:

- This repo is built around explicit grounding and observable state.
- Service-side adaptation or model-improvement workflows are outside the repo's own artifact and continuity model.
- If you prefer continuity to remain explicit, reviewable, and artifact-grounded, the safer default for this workflow is to disable optional retention and feedback features when the platform exposes those controls.

Working style:

1. Treat thread continuation as a convenience, not as the authoritative source of process truth.
2. Start fresh chats more often when the task is inferentially sensitive.
3. For this repo, artifact re-grounding is usually safer than very long-lived conversation state.

Notes:

- Exact setting names and JSON keys can vary by product version, plan, or build.
- If your surface does not expose a given toggle, follow the behavioral rule instead: keep continuity explicit and re-ground from artifacts before trusting old thread state.
- This repo is designed around the idea that you should be able to tell where the important state lives.

## Anti-Tethics

Tiinex does not attempt to solve inference stability through inspirational slogans, floating ethics statements, or abstract alignment theater.

We focus on:

* verification
* continuity hygiene
* recovery
* bounded inspection
* explicit canon formation
* and reducing inference drift in real systems

Less “Tethics.”  
More operational reality.

## Support

If you find this work valuable and want to support its continued development: https://ko-fi.com/Tiinusen
