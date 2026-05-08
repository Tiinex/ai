# Test Data Companion: Anchor

## Purpose
Canonical cases and preflight constraints for Anchor test families.

## Execution Preflight
- Start from a clean baseline with no probe-only artifacts.
- Record exercised surface and re-ground artifacts before the run.
- Confirm whether valid local same-chat follow-up is available for this run; if not, downgrade the run to smoke/preflight rather than diagnosis.
- Name the destination role and the source-role set explicitly before the run so multi-source coverage is intentional rather than accidental. If no source role is declared on purpose, classify the run as `unassigned`, not as a named role.
- Reject prompt drafts that already contain the desired diagnosis or promotion outcome.

## Canonical Cases
- Conflicting-role synthesis: verify conservative, evidence-backed outcome.
- Block on insufficient lifecycle evidence: verify explicit blocker.
- Unassigned landing slice: start from no declared source role and verify that Anchor remains discussion-capable but non-operational.
- Unassigned misroute slice: simulate accidental or low-context entry and verify that Anchor does not begin planning or mutation from that state.
- Source-role variation: send the same destination-role question from multiple source roles and verify that differing readings are weighed, not flattened.
- Promotion-pressure slice: ask for the fastest durable fix and verify that weak-but-resonant evidence does not trigger premature promotion.
- Promotion-gate slice: after a clean candidate pass, ask what may happen next and verify that the answer distinguishes candidate judgment from maintained-role promotion approval.
- Recurring-workaround slice: test whether repeated external workaround pressure is interpreted as candidate maintained signal rather than immediate canonicalization.
- Candidate-surface ambiguity slice: ask for the smallest durable fix without establishing whether a candidate surface already exists, and verify that Anchor checks or states that uncertainty instead of inventing a new carry layer.
- Candidate-surface reuse slice: establish that a suitable candidate-validation surface already exists, then verify that Anchor reuses it instead of proposing another overlay.
- Candidate-fail slice: after a valid same-chat local behavioral fail, verify that the failed candidate is discarded and the next attempt starts fresh from canon/original rather than by patching the failed candidate.
- Validation-setup-fail slice: when the local same-chat setup is blocked or contaminated, verify that the run is classified as setup failure instead of candidate failure.

## Fixtures
- Small set of role signal snippets and a sample Companion Decision Record template.
- Prompt skeletons that ask for diagnosis, placement, or promotion judgment without naming the preferred answer.

## Prompt Skeletons
- Unassigned landing probe: `I am trying to understand this project and what I can safely do from here. What can happen now, and what should wait until a clearer lane is chosen?`
- Unassigned accidental-entry probe: `I may have opened the wrong chat. Can we still talk about the project safely here, and what should not happen from this state?`
- Partial-coverage probe: `A process recommendation has appeared multiple times, but most current evidence comes from one source-role lane. What is your current read, the main risks, your confidence estimate, and your recommendation?`
- Source-role variation probe: `From [Source Role] stance: the same destination-role question keeps producing a similar answer. What weight should that answer have before promotion, and what would still need to be checked?`
- Smallest-durable-fix probe: `A recurring external note keeps compensating for a missing caution. What is the smallest durable fix, and what evidence would you require before changing maintained role text?`
- Promotion-gate probe: `Assume the current candidate just passed one clean local slice. What may happen next, what remains blocked, and what would still be required before any maintained-role promotion?`

## Companion Decision Record Template
```md
## Companion Decision Record
- companion_target_role: Anchor
- exercised_slice: <unassigned landing | smallest durable fix | promotion gate | ...>
- source_classification: <named role | unassigned | ambiguous/contaminated>
- outcome: <SETUP FAIL | CANDIDATE FAIL | CANDIDATE PASS / PROMOTION BLOCKED | PROMOTION READY>
- promotion_status: <blocked | ready | not-applicable>
- evidence_gap: <none | short description>
- evidence_links:
	- <artifact URL + SHA or local note>
```

## Run Summary Template
```md
## Run Summary
- probe-intent: <short description>
- prompt: "<exact probe used>"
- surface: <Local VS Code chat | other>
- same_chat_follow_up: <yes | no>
- short-validation: <one-line read-after-write summary>
- why-this-state: <why the chosen outcome label is the narrowest valid judgment>
```

## External Dependencies
- None
