# Upstream Subagent Runtime Evaluation

This file is a transitional evaluation surface for upstream Copilot subagent behavior.

Use it to record what the current local bundle and observed behavior justify, why the current upstream subagent path is a poor fit for epistemic or recoverability-sensitive work, and what a Tiinex-owned substitute would need to preserve instead.

Do not treat this file as canon, as the `ai-vscode-tools` implementation source of truth, or as permission to flatten the current hypothesis into a shipping design.

## Scope Boundary

- This evaluation is based on two evidence classes only: observed multi-role behavior and local bundle inspection of the installed Copilot Chat extension on the current host.
- Treat local bundle evidence as stronger than role speculation when the two disagree.
- Treat this file as an architecture-direction surface, not as proof that Tiinex tooling already implements the recommended substitute.

## Current Read

- The strongest current read is that the upstream subagent path is a distinct bounded orchestration surface optimized for quick completion and compact closure rather than for epistemic grounding or recoverability.
- The working failure phrase remains: `premature operational closure before epistemic grounding is established`.
- Current evidence is now strong enough to treat this as more than a model-quality complaint. The orchestration layer itself appears to be a material causal factor.
- That does not yet prove that every bad run is caused only by orchestration. It does support treating orchestration as a first-class failure source rather than as background noise.

## Bundle-Confirmed Local Evidence

The installed local bundle currently supports the following claims.

- Search and execution subagents are separate orchestration paths rather than a transparent continuation of the main conversation.
- Both paths construct a fresh scoped child conversation with their own `subAgentInvocationId` and `subAgentName`.
- The search subagent wraps the task in a synthetic search framing rather than simply forwarding the original user intent untouched.
- The execution subagent prompt explicitly pushes the model toward compact `<final_answer>` closure after bounded terminal work.
- The search subagent prompt explicitly pushes the model toward `<final_answer>` output containing code references.
- Both search and execution subagent fetch paths currently set `temperature: 0` in the local bundle.
- Separate tool-call-limit configuration exists for search and execution subagents.

## What Is Still Not Fully Proven

- The exact amount of rich conversation state that survives into the child conversation is still not fully mapped.
- Hidden compaction or summarization before the first subagent step remains plausible, but is not yet proven as the primary causal mechanism.
- The exact relative weight of instruction injection versus child-conversation reset versus closure forcing is still not isolated cleanly enough to rank them with confidence.

## Interpretation Boundary

- The current evidence does not justify saying that upstream subagents are "broken" in general.
- It does justify saying that the current upstream subagent path is poorly aligned with tasks that need open-ended reasoning, epistemic patience, recoverable ambiguity, or faithful continuation of a grounded dialog state.
- The current evidence also does not justify the simpler slogan "remove all guardrails".
- The stronger conclusion is narrower: Tiinex should avoid relying on hidden upstream guardrails that silently rewrite the task, force closure style, or reset the effective reasoning surface without an explicit contract.

## Strategic Consequence

- If Tiinex needs subagent behavior for epistemic, role-faithful, or recoverability-sensitive work, it should not treat the upstream subagent path as a transparent substrate.
- The likely durable direction is a Tiinex-owned subagent lane with explicit, repo-owned bounds instead of hidden upstream orchestration pressure.
- The point is not to build an unbounded agent with no brakes.
- The point is to own the brakes explicitly so the behavior stays traceable: what context is carried, what prompt wrapper exists, what budget applies, what tool limits exist, when closure is required, and what evidence counts as completion.

## What A Tiinex-Owned Subagent Lane Should Preserve

### 1. Context Contract

- The carried context should be explicit: exact user task, relevant prior turns, relevant files, and any deliberate reductions.
- A child lane should not silently drop or rewrite the governing task framing.
- If context is compressed, the compression artifact should be inspectable.

### 2. Prompt Contract

- Any wrapper text should be narrow, visible, and task-shaped rather than a broad hidden instruction injection layer.
- The wrapper should not force deliverable mode unless the parent task explicitly requests deliverable mode.
- Closure style should be selected by Tiinex policy or task need, not by hidden upstream defaults.

### 3. Tool Contract

- Tool availability, iteration count, and tool-call limit should be explicit and inspectable.
- Bounded tooling is still desirable, but the bound should be an owned product decision instead of a hidden upstream pressure source.

### 4. Evidence Contract

- The subagent should return enough evidence to diagnose what happened: carried input, effective wrapper, tool trace, and reason for stop or completion.
- A clean result should be distinguishable from an early forced closure.

### 5. Failure Contract

- If the lane cannot carry enough context or cannot continue without ambiguity collapse, it should fail as `insufficient grounding` rather than fabricating clean completion.
- Recoverable uncertainty should be surfaced, not optimized away for polish.

## Immediate Design Direction

- Treat this as a new architecture leg rather than as a small role-file tweak.
- Keep the first implementation target narrow: a minimal reproducible failure chain and a minimal owned substitute, not a broad autonomous framework.
- The substitute should first prove one thing cleanly: that the same task, model, and repo context behave differently when Tiinex controls the subagent wrapper and evidence contract.
- The current planning surface for that owned substitute now lives in `.github/transitions/TRACEABLE_SUBAGENT_RUNTIME_PLAN.md`.

## Minimal Reproducible Failure Chain

The next useful proof should hold these stable:

- same task
- same model
- same repo context
- same initial human wording

Only the orchestration path should differ.

Compare at minimum:

- ordinary direct chat or same-session live chat
- upstream subagent path
- Tiinex-owned bounded subagent prototype when available

Log at least these first-failure moments:

- first unsupported assumption
- first uncertainty collapse
- first fabricated continuity
- first premature closure

## Current Recommendation

- Keep this evaluation provisional but durable enough for repo carriage.
- Do not collapse it into README product claims yet.
- Do not translate it into "no guardrails" language.
- Do translate it into a design principle: explicit Tiinex-owned bounds are acceptable; hidden upstream orchestration pressure is not an acceptable default for epistemic work.