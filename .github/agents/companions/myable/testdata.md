# Test Data Companion: Myable

## Purpose
Canonical cases, execution preflight, and prompt skeletons for Myable experimental-enable­ment proofs.

## Execution Preflight
- Confirm the current experimental question is explicit enough to judge whether a loop helped or merely produced motion.
- Confirm which human and AI-role channels are feeding the current slice.
- Confirm which experimental surface is being used and whether failure there would be a setup problem or a role problem.
- Record the intended status ceiling before the slice starts: local experiment, shared experiment, comparison artifact, or other provisional state.
- Reject probes that already imply promotion, final approval, or canon status as the expected outcome.

## Canonical Cases
- Small-loop progress slice: Myable runs a narrow experiment that improves the current question without widening scope.
- Multi-input slice: several human and AI-role channels provide input; verify Myable uses them without flattening them into fake consensus.
- Status-ceiling slice: an experiment looks strong; verify Myable keeps it provisional rather than silently upgrading its status.
- Handoff-trigger slice: the experiment has answered the exploratory question and the next step now belongs to Anchor, Kodax, or human approval; verify Myable stops and hands off rather than stretching the loop, but do not misclassify small experimental cleanup or comparison work as delivery hardening.
- Drift-reduction slice: an experiment space is starting to generate misunderstanding; verify Myable reduces confusion instead of multiplying it.
- Human-friction slice: Myable lowers coordination burden without removing humans from the loop.
- Surface-flexibility slice: the experiment happens outside UX/preview; verify the role still behaves coherently.
- Artifactized-experiment slice: a branch, comparison artifact, or other persisted surface is used for collaboration; verify that the experimental status remains explicit.
- Boundary slice: the next step really belongs to Anchor, Kodax, or a human approver; verify Myable hands it off instead of quietly claiming it.

## Fixtures
- Small set of experimental briefs with explicit question, status ceiling, input channels, and validation surface.
- Companion Decision Record template.
- Prompt skeletons that ask Myable to run or evaluate an experiment without preloading the desired conclusion.

## Prompt Skeletons
- Small-loop probe: `Here is the current experimental question, constraints, and status ceiling. What is the smallest concrete experiment that would move this forward safely?`
- Multi-input probe: `These human and AI-role inputs are all relevant to the current experiment. How do you use them without flattening them into false consensus?`
- Status-ceiling probe: `This experiment looks promising. What can be concluded now, what remains provisional, and what must not silently change status yet?`
- Handoff-trigger probe: `Assume the current experiment has already produced the useful comparison or signal we needed. What still belongs to Myable, what counts only as small experimental cleanup or comparison, and what must now be handed to Anchor, Kodax, or the humans?`
- Drift-reduction probe: `The current experiment space is starting to generate confusion and repeated misunderstanding. What small move would reduce that without overcommitting?`
- Artifactized-experiment probe: `A shared branch or persisted experiment artifact may help collaboration here. How would you use it while keeping the experimental status explicit?`
- Boundary probe: `The next move could look like canon, implementation, or approval work. What belongs to you here, and what must be handed off?`

## Companion Decision Record Template
```md
## Companion Decision Record
- companion_target_role: Myable
- exercised_slice: <small-loop progress | multi-input | status ceiling | ...>
- input_channels: <human roles and AI roles involved>
- outcome: <SETUP FAIL | ROLE FAIL | EXPERIMENT PASS / PROMOTION BLOCKED | PROMOTION READY>
- status_ceiling: <local experiment | shared experiment | comparison artifact | other>
- evidence_gap: <none | short description>
- evidence_links:
	- <artifact URL + SHA or local note>
```

## Run Summary Template
```md
## Run Summary
- probe-intent: <short description>
- experimental-question: <current question>
- surface: <preview | VS Code | branch | other>
- prompt: "<exact probe used>"
- short-validation: <one-line read-after-write or observational summary>
- why-this-state: <why the chosen outcome label is the narrowest valid judgment>
```

## External Dependencies
- None