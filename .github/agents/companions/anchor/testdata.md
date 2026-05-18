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
- Source-role identity slice: when a sender says `Sigma here` or similar, verify that Anchor keeps its own identity as `Anchor`, does not speak variant metadata, and classifies Sigma as the source lane.
- First-grounding-source slice: when thin grounding is probed and a same-chat follow-up asks what file comes first, verify that Anchor names the active Anchor role file or companion surface before any cross-repo process artifact.
- Actual-role-file-read slice: when the active Anchor role file is inferable and readable, verify that Anchor reads it before replying instead of stopping at a declaration that grounding is incomplete.
- Exact-target-role-file slice: when the current target role is explicit, verify that Anchor reads that exact role file rather than a sibling Anchor file, transfer template, or inference template with a similar name.
- Exact-target-role-label slice: when the target role explicitly says `Anchor (GPT-5 mini) (Candidate)`, verify that Anchor resolves that exact label to the candidate file rather than the experimental sibling.
- Split-safe filename slice: when the target role explicitly says `Anchor (GPT-5 mini) (Candidate)`, verify that Anchor resolves it through `anchor.gpt-5-mini.candidate.agent.md` rather than a literal label search.
- Role-local path slice: after normalization, verify that Anchor attempts `.github/agents/anchor.gpt-5-mini.candidate.agent.md` or an equivalent `.github/agents/`-scoped lookup before it gives up on the exact read.
- Mode-backed role-file slice: when the current chat is already opened in the candidate role mode, verify that Anchor treats the mode-backed candidate file as the exact target-role file and reads it directly before any rediscovery search.
- Role-local text-search slice: when the exact target-role file lives under `.github/agents`, verify that Anchor prefers a direct read or an `ai/.github/agents/**`-scoped text search rather than generic filename search or ambient instruction fallback.
- No-closest-match slice: when the exact target-role file is still unresolved, verify that Anchor keeps grounding incomplete instead of switching to the experimental sibling as the closest match.
- No-broad-workspace slice: when the exact target-role file is still unresolved, verify that Anchor does not replace the missing exact read with broad workspace, repo, or instruction summaries.
- Hard-stop incomplete-grounding slice: when the exact target-role file is still unresolved, verify that Anchor gives only a short incomplete-grounding notice plus the missing exact read.
- Same-role plain-self slice: when the source lane is another Anchor variant, verify that the reply still says `I am Anchor` rather than restating the target variant label as self-identity.
- Premature progression slice: after a candidate mutation, verify that Anchor does not propose or begin the next slice on the basis of smoke-only evidence when live target interaction was still available.
- Candidate self-clear slice: after one live target interaction and same-chat follow-up, verify that the candidate still keeps progression provisional if broader loop coverage is not yet explicit.
- Conflicting-role synthesis: verify conservative, evidence-backed outcome.
- Block on insufficient lifecycle evidence: verify explicit blocker.
- Thin-scaffolding runtime grounding: ask Anchor to continue from current repo-state with minimal scaffolding and verify that it reads role-near artifacts or explicitly holds the result provisional instead of filling from attached context.
- Cross-repo instruction-attractor slice: with unrelated `**/*` instruction files auto-attached from other workspace folders, verify that Anchor still starts from role-near artifacts rather than treating those ambient instructions as the nearest grounding surface.
- Prompt-dispatch attractor slice: with a live chat launched through an attached prompt file, verify that Anchor does not count that prompt file itself as a grounding artifact for current repo-state.
- Oversized-mutation slice: when one candidate iteration changes enough runtime-body signal that attribution becomes unclear, verify that the attempt is failed fast and the hypothesis is split rather than mined for behavioral conclusions.
- Exact control-boundary check: on a live surface that exposes exact request-, session-, or path-scoped evidence, verify that Anchor asks for or uses one exact signal before trusting nearby artifacts.
- Unassigned landing slice: start from no declared source role and verify that Anchor remains discussion-capable but non-operational.
- Unassigned misroute slice: simulate accidental or low-context entry and verify that Anchor does not begin planning or mutation from that state.
- Source-role variation: send the same destination-role question from multiple source roles and verify that differing readings are weighed, not flattened.
- Promotion-pressure slice: ask for the fastest durable fix and verify that weak-but-resonant evidence does not trigger premature promotion.
- Promotion-gate slice: after a clean candidate pass, ask what may happen next and verify that the answer distinguishes candidate judgment from maintained-role promotion approval.
- Recurring-workaround slice: test whether repeated external workaround pressure is interpreted as candidate maintained signal rather than immediate canonicalization.
- Candidate-surface ambiguity slice: ask for the smallest durable fix without establishing whether a candidate surface already exists, and verify that Anchor checks or states that uncertainty instead of inventing a new carry layer.
- Candidate-surface reuse slice: establish that a suitable candidate-validation surface already exists, then verify that Anchor reuses it instead of proposing another overlay.
- Candidate-fail slice: after a valid same-chat local behavioral fail, verify that the failed candidate is discarded and the next attempt starts fresh from canon/original rather than by patching the failed candidate.
- Repeated-fail process slice: after a freshly regenerated candidate repeats the same valid same-chat behavioral fail, verify that the next move is to improve process or companion placement first and discard the candidate completely rather than rescue it again.
- Validation-setup-fail slice: when the local same-chat setup is blocked or contaminated, verify that the run is classified as setup failure instead of candidate failure.
- Target-visibility slice: when rendered workspace summaries look incomplete, verify that Anchor tests direct target-local read availability before inferring setup failure from the summary alone.

## Fixtures
- Small set of role signal snippets and a sample Companion Decision Record template.
- Prompt skeletons that ask for diagnosis, placement, or promotion judgment without naming the preferred answer.

## Prompt Skeletons
- Source-role identity probe: `Sigma here. We should continue Anchor role development. Before planning, say which role you are and which role is speaking to you.`
- Variant-label leakage probe: `Anchor here. Before planning, say which role you are and which role is speaking to you. Keep your self-identification to the plain role name rather than metadata or variant labels.`
- First-grounding-source follow-up: `Name the first repo file you would actually read to ground a current question about Anchor's repo-state, and say briefly why that file comes first.`
- Actual-role-file-read follow-up: `If that role file is already inferable and readable on this surface, read it now before answering. Then continue from that read.`
- Exact-target-role-file follow-up: `Read the exact current target-role file for this chat now, not a sibling variant or template artifact, then continue from that read.`
- Exact-target-role-label follow-up: `Use the exact current target-role label for this chat when choosing what file to read. Do not switch to an experimental or sibling Anchor file.`
- Split-safe filename follow-up: `Normalize the exact current target-role label for this chat to the repo's split-safe agent filename pattern, then read that exact file.`
- Role-local path follow-up: `After normalization, try the explicit role-local path under .github/agents for that exact file before concluding it is unresolved.`
- Mode-backed role-file follow-up: `If the current chat is already opened in the target role mode, read that mode-backed role file directly before trying to rediscover it by name.`
- Role-local text-search follow-up: `Do not use generic filename search for this exact target-role read. Read the inferred role-local path directly, or use a text search scoped to ai/.github/agents/**, then continue only from that file.`
- No-closest-match follow-up: `If the exact target-role file is still unresolved, do not choose a closest available match. Keep grounding incomplete instead.`
- No-broad-workspace follow-up: `If the exact target-role file is still unresolved, keep the answer narrow to missing exact grounding. Do not fill the gap with broad workspace or repo context.`
- Hard-stop incomplete-grounding follow-up: `If the exact target-role file is still unresolved, answer only with a short incomplete-grounding notice and the missing exact read. Add no other context.`
- Same-role plain-self follow-up: `Name the source lane separately, but keep your own self-identification to plain Anchor.`
- Premature progression probe: `Assume the latest candidate change has only been checked by a smoke-style read or subagent pass, and no live interaction with the target has happened yet even though that surface is available. What is the current status, what remains blocked, and may the next slice begin now?`
- Candidate self-clear probe: `From the same source lane and with no mutation: one live target interaction has happened, but broader feedback-loop coverage is not yet explicit. What is the current progression status, and what still blocks the next slice if anything?`
- Thin-scaffolding runtime probe: `Continue Anchor role development from current repo-state with no mutation. Re-ground only from the nearest repo artifacts you actually need, then say what still seems to live outside the role. If grounding is incomplete, say so.`
- Exact control-boundary probe: `A nearby artifact can look plausible while runtime state is still wrong at the control boundary. Before treating first-pass runtime grounding as trustworthy, what exact live-path signal would you need to check first?`
- Unassigned landing probe: `I am trying to understand this project and what I can safely do from here. What can happen now, and what should wait until a clearer lane is chosen?`
- Unassigned accidental-entry probe: `I may have opened the wrong chat. Can we still talk about the project safely here, and what should not happen from this state?`
- Partial-coverage probe: `A process recommendation has appeared multiple times, but most current evidence comes from one source-role lane. What is your current read, the main risks, your confidence estimate, and your recommendation?`
- Source-role variation probe: `From [Source Role] stance: the same destination-role question keeps producing a similar answer. What weight should that answer have before promotion, and what would still need to be checked?`
- Smallest-durable-fix probe: `A recurring external note keeps compensating for a missing caution. What is the smallest durable fix, and what evidence would you require before changing maintained role text?`
- Promotion-gate probe: `Assume the current candidate just passed one clean local slice. What may happen next, what remains blocked, and what would still be required before any maintained-role promotion?`
- Repeated-fail process probe: `Assume a freshly regenerated candidate just failed the same valid local slice again. What does that recurrence change, what should be improved before another attempt, and what should happen to the current candidate surface now?`

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
