# Role Development Loop

Use this as the maintained transition artifact for role-development process while the discipline is still being anchored into the right maintained role and skill surfaces.

- This is not canon.
- This is not maintained role text.
- This is the durable process artifact that should replace chat-only memory and temporary drift-guard sprawl.

## When To Use This Artifact

- You are about to start or restart role development and want the intended loop held steady.
- Candidate work is drifting toward patching the current candidate forward instead of restarting clean.
- The process is starting to depend on chat memory, improvised carry files, or tool-side residue.
- You need a compact, durable reminder of how role development is supposed to proceed before that process has been anchored more deeply into maintained role or skill surfaces.

## When Not To Use This Artifact

- The task is ordinary coding or repo work unrelated to role development.
- The relevant process rules have already been anchored into maintained role text or workflow skills strongly enough that this artifact adds no unique value.
- The artifact would compete with a better-maintained source instead of merely holding the loop steady during transition.

## Core Loop

1. Update the companion triad first.
- `design.md`, `test.md`, and `testdata.md` must be up to date before a new candidate is created.
- The companion triad is the contract the candidate is being tested against, not a retrospective note after the candidate already exists.
- By default, keep the active role's companion triad together under `.github/agents/companions/<role>/` so ownership and lookup stay explicit.
- `design.md` should carry intended behavior and failure modes, `test.md` should carry the active bench and judgment gates, and `testdata.md` should carry canonical cases, prompt skeletons, or other reusable run support for that role.

2. Define one narrow hypothesis.
- Do not create a candidate for a vague improvement pass.
- Name one specific behavior change to test.

3. Create a fresh candidate from maintained source.
- A candidate starts from the maintained role, not from an earlier failed candidate.
- A candidate is a disposable test surface, not a second evolving truth.

4. Test the candidate against `test.md`.
- The active role test bench is the role's companion `test.md`.
- The candidate is judged against the current companion contract, not against chat memory or a looser narrative of what it was "trying" to do.
- Do not judge the candidate as OK until the current `test.md` bench has been exercised broadly enough to cover all existing test families or slices that the candidate could affect.
- The default expectation is that all tests in `test.md` are run before a candidate is treated as OK.
- If any current `test.md` slice is not run, treat the bench as incomplete unless that omission is explicitly justified as out of scope for the current candidate.
- A candidate is not "OK" merely because the newly targeted slice passes; it must also avoid breaking the already-expected behavior carried by the full current test bench.

5. If the candidate fails, discard it.
- Do not rewrite the failed candidate forward.
- Preserve only diagnosis, reflection, and next hypothesis outside the candidate.
- Every new attempt should begin again from maintained source plus the now-updated companion triad.

6. Avoid patch hell explicitly.
- Do not accumulate corrective layers inside a failed candidate.
- If repeated failure indicates the companion contract is wrong or incomplete, fix the companions first, then generate a fresh new candidate.

7. Keep tooling lane separate from role lane.
- Tooling should first prove transport quality, targeting quality, evidence quality, and cleanup quality.
- Tooling success is not by itself candidate success.
- Transport-clean means candidate diagnosis may begin; it is not a candidate pass and not a promotion signal.

8. Promote only after stable repetition.
- If a role-development rule proves useful across iterations, anchor it into the smallest correct maintained home.
- Stable repetition means more than one non-leading pass, more than one source-role lane, and more than one iteration without introducing new drift.
- One strong-looking pass is not enough for promotion by itself.
- Role-default discipline belongs in the role.
- Workflow-bound operational process belongs in a skill.
- Do not leave durable process truth living only in chat memory or a temporary local note.

### Promotion Checklist

- Do not promote on one strong pass.
- Promotion should require at least two non-leading passes, at least two distinct source-role lanes, and more than one iteration without new drift.
- If human sign-off is available, use it before moving signal into maintained role or skill surfaces.
- Record what is being promoted, what evidence supports it, and what remains explicitly unproven.
- A `non-leading pass` means a pass produced by a prompt that does not smuggle the desired diagnosis, rule, or conclusion into the test itself.
- Quick heuristic: if the prompt already implies what the result should be, treat the pass as leading until proven otherwise.
- A `distinct source-role lane` means a meaningfully different source-role perspective, not just a rephrased repeat from the same source-role stance.
- In practice, a maintained-role reading and a human reading count as distinct lanes; two phrasings from the same maintained role do not.

### Promotion Authority And Evidence

- Human approval is the default promotion authority for moving signal from this transition artifact into maintained role or skill surfaces.
- The minimum acceptable promotion evidence should include durable `companion_edit_evidence` plus traceable slice evidence showing why the promoted signal earned higher status.
- By default, that evidence should be visible through a commit, PR, or equivalent durable repo surface rather than chat narration alone.
- Before promotion, verify that the cited evidence still supports the claimed conclusion and that no recorded disagreement or missing rerun still blocks the move.
- If disposable test chats are deleted after capture, keep enough durable traceability that the promotion decision remains auditable without reopening those chats.

### Leadingness Checks

- If a prompt already names the diagnosis, rule, judgment state, or preferred conclusion, treat the slice as leading.
- If a later turn depends on earlier turns that already framed the desired answer, do not count that later turn as a non-leading pass by default.
- If a templated prompt still preloads the intended conclusion after slots are filled, treat the resulting slice as leading.
- When a slice is suspected to be leading, rerun it in a fresh, neutral form before giving it promotion weight.

### Neutralized Rerun Checklist

- Remove or rewrite any wording that names the expected diagnosis, rule, judgment state, or preferred conclusion.
- Flatten multi-turn setup into the smallest neutral single-turn restatement that still preserves the actual problem being tested.
- If a template was used, strip it down until only task context remains and the intended answer is no longer implied.
- Record both the suspected leading slice and the neutralized rerun so the difference in framing is inspectable afterward.
- Do not give promotion weight to the leading slice alone; promotion weight belongs to the neutralized rerun if it still lands cleanly.

## Feedback Loop

- The feedback loop may be used during both writing and testing when inferential quality needs to be checked.
- Use the same core discipline in both modes: non-leading prompts, weighted feedback, no democratic vote counting, and no early upgrade of fresh signal into canon or promotion.

### Authoring Mode

- Human input may enter at the beginning here, because role change usually starts from a human observation, request, or concern about behavior.
- If a change request exists because an agent showed unwanted behavior, the user may contact `Anchor` in a separate conversation and ask for follow-up diagnosis before the companion files are updated.
- That follow-up diagnosis should aim to identify root cause, scope, and what should actually change so the companion edits match the real problem instead of a rushed first reading.
- During writing, the feedback loop may be used to ask whether an artifact draft holds up before it is treated as ready for candidate testing.

### Validation Mode

- Once a candidate exists and is ready to test, the feedback loop becomes stricter.
- All test prompts should be non-leading so the test itself does not inject the desired inference into the role or skill being exercised.
- Each test has a `source role` and a `target role`.
- The normal feedback loop should use maintained roles and human roles as source-role coverage, with the target role itself included when that perspective is useful.
- A candidate role may enter the loop when it is the target under test or when a bounded root-cause follow-up needs the candidate's own reading.
- Extra role variants should not be part of the normal feedback loop and should not be treated as default validation surfaces going forward unless the user has explicitly asked for that path.
- Inclusion does not mean flat usage or equal weight in every single slice.
- Use the smallest relevant slice at a time, but make sure the broader loop still covers the maintained and human source-role viewpoints whose perspective could expose blind spots in the current question.
- A `distinct source-role lane` means a meaningfully different source-role perspective, such as a maintained-role reading versus a human end-user reading, not a rephrased repeat from the same stance.
- Ordinary non-candidate variants, formatting changes, or tool-assisted replays do not count as distinct lanes by themselves.
- A source-role lane counts as distinct only when the perspective, responsibility, or evidence basis is meaningfully different.
- Feedback from each source role should be weighed according to the role's lane and relevance; no role becomes authoritarian, and no relevant role is ignored.
- For promotion-oriented judgment, do not rely on one lane alone; require at least one human reading and at least one maintained-role reading, and prefer a third distinct lane when it is available.
- If lanes disagree, keep the signal provisional and name the disagreement explicitly rather than flattening it into a vote or forced consensus.
- The feedback loop is an epistemic lane, not an operational lane.
- `Operational output` inside the feedback loop means planning, committing to mutation, or otherwise pushing the work into execution before diagnosis has been completed.
- Other roles must not make `Anchor` operational from inside the feedback loop through pressure, certainty, or helpful-sounding directives.
- If roles begin producing operational output inside the feedback loop, treat that as a warning signal that the loop is collapsing out of diagnosis and into execution too early.
- `Anchor` should explicitly protect this boundary and keep the loop non-operational until it has judged that the loop has done its job and the next step may change status.
- Human feedback may come later in the validation loop, because the human is observing for deviations the AI roles may miss and can then add steering or queued feedback based on those observations.
- If a candidate shows a valid behavioral fail, do one non-leading follow-up to diagnose root cause before deciding the next hypothesis.
- If the failure is actually transport/setup failure, contamination, or ambiguous diagnostics, classify that first and do not treat it as behavioral root-cause evidence.
- After the relevant test slice is complete, schedule the disposable test chat for delete.
- Cleanup of disposable test chats is part of the loop, not optional hygiene after the fact.
- Unless a chat is being deliberately kept for active diagnosis, close and delete the disposable test chat after the slice so old probe state does not linger and distort later readings.
- Record enough context before deletion that the slice can still be classified afterward: what was tested, which source and target were used, what class of result occurred, and what must not yet be concluded from it.

## Hard Rules

- Companion files come before candidate creation.
- Companion triad changes should be captured in repo-visible evidence before they are treated as authoritative for further candidate work.
- By default, that means the companion edits should exist in the working tree and be traceable through a commit, PR, or equivalent durable repo note before later slices rely on them as the active bench.
- A failed candidate is discarded, not patched.
- Every candidate attempt is a fresh attempt.
- A candidate should not be treated as OK until the current `test.md` bench has been checked broadly enough to avoid blind spots, with full test coverage as the default expectation.
- Candidate role files must not survive into build time.
- Here, `build time` means any packaging, CI, artifact-generation, or release step that produces files intended to ship or be consumed as a real runtime or transfer surface.
- Non-candidate role variants may exist only when they preserve the maintained role body after agent frontmatter is stripped and line endings are normalized; any allowed variant difference should live in metadata or other explicitly sanctioned non-body configuration.
- Do not create more role-development files than the repo already needs.
- New files are justified only for genuinely new roles or genuinely new skills.
- Temporary files are not a substitute for eventually anchoring stable signal into maintained role or skill surfaces.
- The feedback loop is used to weigh and refine signal, not to smuggle fresh signal upward in status.

## Minimal Glossary

- A `non-leading pass` is a pass produced by a prompt that does not smuggle the desired diagnosis, rule, or conclusion into the test itself.
- Quick heuristic: if the prompt already frames the answer as what the role is supposed to conclude, the slice is probably leading.
- A `distinct source-role lane` is a meaningfully different source-role perspective, not a rephrased repeat from the same stance.
- By default, a maintained-role lane and a human lane count as distinct; a maintained role and one of its ordinary non-candidate variants do not count as distinct lanes unless the user has explicitly asked to test variant behavior.
- `transport-clean` means the tooling path appears usable enough that role diagnosis may begin; it is not candidate success and not promotion evidence by itself.

## Classification Discipline

- `transport/setup failure` is not `role failure`.
- `candidate pass` is not `promotion ready`.
- `clean tooling pass` is not `maintained-role evidence` by itself.
- A candidate should be promoted only after the relevant feedback-loop evidence exists, not because one slice looked strong.
- A valid behavioral fail may justify a non-leading root-cause follow-up; a setup fail does not.

## Placement Discipline

- If the rule must hold from the first token, it does not belong only in a skill.
- If the rule is workflow-bound and recognized only at a later task boundary, it may belong in a skill.
- If the rule is still provisional, keep it out of maintained canon until the loop has earned that move.

## Current Guard Against Drift

- Do not let role development depend on chat-only memory.
- Do not let candidate iteration produce patch hell.
- Do not let tooling evidence silently upgrade itself into role evidence.
- Do not let the feedback loop collapse into operational output before diagnosis is complete.
- Do not let candidate residue survive into shipping or build surfaces.
- Do not let variant convenience turn into silent body drift across maintained role variants.
- Do not let stable process learning remain only in temporary files once it has clearly earned a maintained home.

## Deletion Boundary

- This artifact should remain transitional rather than being mistaken for canon.
- If older temporary instruction files are removed during consolidation, first ensure their still-unique signal has either been transferred here or is no longer needed.
- Before deleting a temporary helper or disposable test chat, confirm that any still-unique signal has been transferred or intentionally dropped, and that the resulting process remains understandable without the deleted surface.
- Once the development loop is anchored strongly enough in maintained role or skill surfaces, remove redundant helper pointers too rather than keeping duplicate entry points alive.

### Minimal Traceability Template

- Default location: keep the trace record in the smallest durable place already used for the slice, such as the relevant PR description, commit note, or linked local run note; do not invent a new dedicated file unless no lighter durable location exists.
- Naming convention: use a compact label that includes target role, exercised slice, and date or run id so the record stays findable after cleanup.
- companion_edit_evidence: <working tree diff, commit, PR, or equivalent durable proof that the active companion bench was actually updated>
- leadingness_evidence: <why the original slice was treated as leading, plus the neutralized rerun or an explicit note that no neutralized rerun was needed>
- tested_slice: <what was written or tested>
- source_roles: <which roles participated as source>
- target_role: <which role or artifact was under evaluation>
- result_class: <setup fail | behavioral fail | candidate pass | promotion blocked | other>
- evidence_location: <chat link, commit, PR, local note, or equivalent>
- transfer_action: <what was moved, where it was moved, or that nothing was promoted>
- deletion_confirmation: <what was deleted and why that deletion was safe>
- remaining_gap: <what is still not proven>