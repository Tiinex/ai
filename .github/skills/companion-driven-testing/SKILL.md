---
name: Companion-driven testing
description: Human-first, artifact-driven testing using companion markdown files (design, test, testdata).
argument-hint: Provide the target artifact name or run intent.
model: GPT-5 mini (copilot)
---

# Companion-driven testing

Purpose
- Provide a human-first, markdown-native testing skill that treats companion files as the canonical test source.
- Avoid operational, script-driven tests that bypass the feedback loop; produce human-verifiable run artifacts.

Principles
- Artifact-first: the companion markdown files (`agent-architect.*.md`, `companions/*`) are the single source of truth for test goals and data.
- Non-operational by default: this skill describes and generates non-executing test artifacts and human checklists; it does not perform automated agent runs unless explicitly enabled by a user with credentials and approval.
- Evidence-bound: every proof must preserve read-after-write evidence and a `Companion Decision Record` adjacent to run provenance.

When to use
- Use this skill when you want to develop or validate an agent's behavior while preserving the human feedback loop and clear provenance.

How it works (manual flow)
1. Re-ground: Re-open and read the relevant companion files under `.github/agents/companions/<role>/` (`design.md`, `test.md`, `testdata.md`). Confirm the runtime artifact and surface to exercise.
2. Draft a neutral probe: Create a one-off, neutral, non-leading prompt in a new markdown run artifact (see template below). Do not copy companion explanatory text verbatim into the probe.
3. Execute the probe manually in the intended surface (Local chat/Hosted preview) and capture raw outputs.
4. Validate evidence: preserve read-after-write outputs, file diffs, and commentary as a markdown run artifact and include a `Companion Decision Record` block.
5. Cleanup: remove any probe-only spill files or UI state before closing the run.

Run artifact template (example)
```
---
run-id: run-2026-05-01-01
date: 2026-05-01T13:00:00Z
surface: Local VS Code chat
target: docs/targets/SectionSyncer
outcome: PASS | FAIL | INCONCLUSIVE
evidence-files:
  - docs/targets/SectionSyncer.md
  - workspace-diff.patch
---

## Companion Decision Record
- companion_decision: parent-proof-sufficient
- companion_target_role: agent-architect
- companion_exception_gap: -
- companion_exception_reason: -

## Run Notes
- prompt: "<neutral prompt here>"
- raw-output: |
  <paste raw model output here>
- validation: <read-after-write summary>
```

Migration / repo hygiene guidance
- Remove script-based harnesses (e.g., `tools/role-tests`) and treat the companions as the canonical bench.
- If you later want lightweight structural validation in CI (presence/format checks of companion files), prefer a tiny validator that only checks markdown structure and required fields — do NOT add an automated execution step that runs or scores agents.

Detailed manual: [Companion run manual](.github/agents/companions/COMPANION_RUNS_MANUAL.md)

See companion conventions: [.github/agents/companions/COMPANION_CONVENTIONS.md](.github/agents/companions/COMPANION_CONVENTIONS.md) — keep `SKILL.md` as an aggregator/instructional document, not as canonical test specs.

Optional: guarded automation
- If you want reproducible automation later, create a gated `execute` mode that requires explicit secrets and an opt-in flag. Keep that mode disabled by default and document the human-review requirements in the skill.

Acceptance criteria for this skill
- Companion files exist for the tested target. 
- Each manual run produces a single markdown artifact with a `Companion Decision Record` and preserved evidence.
- No probe-only artifacts remain after cleanup unless explicitly retained as justified support evidence.

Questions to the maintainer
- Do you want me to remove the `tools/role-tests` folder now, or keep it archived in a separate branch/tag for recovery? (default: delete from main)

---
