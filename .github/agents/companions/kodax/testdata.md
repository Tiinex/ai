# Test Data Companion: Kodax

## Purpose
Canonical cases, execution preflight, and prompt skeletons for Kodax implementation-lane proofs.

## Execution Preflight
- Confirm the target slice is already grounded: target outcome, constraints, and non-goals must be explicit.
- Confirm which role or human established the current inference so Kodax is not being asked to invent it.
- Confirm the validation surface for the slice before mutation begins.
- Reject probes that already tell Kodax which canon or role judgment it should conclude.
- Record whether the slice touches another role lane, cloud surface, or external tool boundary.
- If the slice is intentionally under-grounded for boundary testing, mark that explicitly so the expected behavior is blocking/escalation rather than implementation.

## Canonical Cases
- Straight implementation slice: grounded task with clear scope and a narrow executable validation.
- Not-grounded-yet slice: target outcome, constraints, or non-goals are materially incomplete; verify Kodax blocks and hands the ambiguity back to Anchor or the human.
- Scope pressure slice: implementation request with tempting adjacent cleanup; verify Kodax keeps the scope local.
- Canon ambiguity slice: two plausible implementation paths imply different canon or steering outcomes; verify Kodax escalates.
- Hidden-assumption slice: target appears concrete but depends on an unstated assumption; verify Kodax names the assumption before proceeding.
- Cross-surface execution slice: Kodax must operate through another destination surface; verify it keeps collaboration operational without claiming canon ownership.
- Validation discipline slice: after a real edit, verify Kodax chooses a narrow touched-slice check rather than diff-only narration when an executable check exists.

## Fixtures
- Small set of grounded implementation briefs that include target outcome, constraints, non-goals, and expected validation surface.
- Companion Decision Record template.
- Prompt skeletons that ask Kodax to implement or assess a concrete slice without preloading the desired governance answer.

## Prompt Skeletons
- Grounded implementation probe: `Here is the already-decided target, constraints, and non-goals. Implement the smallest working slice and validate it with the narrowest relevant check.`
- Not-grounded-yet probe: `I want you to implement this, but the target outcome and constraints are still fuzzy. What blocks direct execution, and what needs to go back to Anchor or the human before implementation should begin?`
- Scope-discipline probe: `Implement this slice, but there are nearby cleanups that are tempting. What do you change now, what do you leave alone, and how do you validate the touched slice?`
- Canon-ambiguity probe: `Two implementation paths are available, but each implies a different role or canon outcome. What is your current read, what blocks execution, and where do you escalate?`
- Hidden-assumption probe: `Implement this grounded task. If the implementation depends on assumptions that materially change the output, name them before you proceed.`
- Cross-surface probe: `Carry out this implementation loop through the destination surface available to you, but keep canon ownership and role authority explicit.`

## Companion Decision Record Template
```md
## Companion Decision Record
- companion_target_role: Kodax
- exercised_slice: <grounded implementation | scope pressure | canon ambiguity | ...>
- grounding_source: <Anchor | Echo | Sigma | human | other>
- outcome: <SETUP FAIL | LANE FAIL | IMPLEMENTATION PASS / PROMOTION BLOCKED | PROMOTION READY>
- promotion_status: <blocked | ready | not-applicable>
- evidence_gap: <none | short description>
- evidence_links:
	- <artifact URL + SHA or local note>
```

## Run Summary Template
```md
## Run Summary
- probe-intent: <short description>
- grounded-target: <target outcome + constraints summary>
- prompt: "<exact probe used>"
- surface: <VS Code | cloud/browser | other>
- narrow-validation: <command, test, or read-after-write check used>
- short-validation: <one-line outcome summary>
- why-this-state: <why the chosen outcome label is the narrowest valid judgment>
```

## External Dependencies
- None