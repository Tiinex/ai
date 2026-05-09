# Tooling Evaluation

This file is a transitional evaluation surface for Tiinex tooling.

Use it to record what the current repo artifacts already prove about tooling support, what still limits role-development work, and which tests or use cases must pass before the tooling can be treated as a reliable enabler rather than a recurring source of drift.

Do not treat this file as canon, a role definition, or the tooling repo source of truth.

## Scope Boundary

- This evaluation is based on artifacts available in this AI repo.
- The tooling repo is not part of the current workspace, so implementation claims remain indirect unless they are already captured here as repo-side evidence.
- Treat this file as a consolidation of current repo-borne evidence, not as proof that every referenced tooling fix is live in the running VS Code host.

## Current Read

- The repo already carries meaningful tooling knowledge, but it is spread across temporary local investigation notes, workflow skills, recovery notes, and process surfaces rather than one explicit tooling-status artifact.
- Current evidence supports a medium-confidence read that Tiinex tooling has improved materially and can sometimes support clean Local same-chat passes.
- Cleanup capability has also improved: chat deletion now exists as an available tooling path, which lowers one practical hygiene cost in role-development work.
- Current evidence does not yet support treating the tooling as a fully trusted validation surface for Anchor Candidate promotion decisions.
- The strongest remaining uncertainty is not only whether the tooling logic is correct in repo, but whether the live host/session path is clean, exact, and settled enough at the moment of use.

## What The Repo Already Makes Clear

### Proven Or Near-Proven Support

- Tooling-aware hygiene now spans a cross-repo split: the AI repo carries a repo-side hygiene and drift-control surface in `.github/skills/vscode-local-live-chat-hygiene/SKILL.md`, while the primary direct-operation workflow skills live in the tooling repo.
- The repo explicitly distinguishes transport/setup failure from candidate-behavior failure in Anchor companion and temporary investigation artifacts.
- Session-derived evidence is now treated as more trustworthy than a lagging canonical transcript when the transcript stalls before the latest settled turn.
- Request participant and custom mode are now treated as separate evidence surfaces for Local custom-agent verification.
- Cleanup no longer depends only on manual residue management; chat deletion now exists as a real tooling capability that can support disposable-probe hygiene when it works as intended.
- The repo-side investigation has already identified and narrowed multiple false-green and false-abort classes rather than treating all Local failures as one vague instability.

### What Is Still Weak Or Incomplete

- The current repo does not provide one maintained, bounded matrix for tooling capability, limitation, and required pass criteria.
- Much of the most concrete Local live-chat evidence still lives in temporary instruction files rather than a clearer long-lived evaluation artifact.
- High-weight manual clean-room comparison remains missing or underrepresented relative to medium-weight tool-driven evidence.
- Current artifacts still imply that tooling success can depend on reload state, host behavior, or fallback path, which means repo-side fixes alone are not enough evidence of live reliability.

## Main Improvement Areas

### 1. Exact Targeting Must Outrank Focused Fallback

Current issue:
- Local exact session-targeted send appears unsupported or unreliable on the current build, so some runs still depend on reveal plus focused fallback.
- That fallback path has historically been the main contamination risk because the active control thread can leak planning or tool-governance state into the target chat.

Required improvement:
- Prefer a truly exact-session Local send path whenever the target session is known.
- If the runtime cannot provide that path, the tooling should classify the run as fallback-dependent evidence rather than implying stronger targeting guarantees than it has.
- Focused-send should stay explicitly downgraded until the non-self target is verified.

Why it matters:
- Without trustworthy exact targeting, Anchor Candidate behavior and tooling transport behavior remain too easy to confuse.

### 2. Lifecycle Settlement Must Be Trustworthy

Current issue:
- Repo artifacts document several lifecycle faults: success returned before the assistant answer settled, false-green success from seed-only sessions, and cases where host-side completion occurred while the tool-return path still dropped the completion signal.

Required improvement:
- A run must not return `ok` unless the real prompt send was attempted and the target session shows settled persisted evidence for that send.
- Completion recovery may use stored session evidence, but only when the workflow can prove that the real prompt step actually happened.
- A seed-only settled session must never be re-labeled as a full successful create/send lifecycle.

Why it matters:
- If settlement is overstated, the tooling becomes a confidence amplifier for false evidence instead of a reducer of ambiguity.

### 3. Contamination Detection Must Be Precise

Current issue:
- Control-thread contamination has been real in some sessions, but the repo also shows false contamination detection where ordinary scaffold tags were treated as leak evidence.

Required improvement:
- Contamination detection should key on real operational artifacts such as TODO spill, tool-governance text, or actual tool markers instead of broad host scaffolding alone.
- Detection should separate `contaminated`, `clean`, and `unjudged` rather than flattening all anomalies into hard failure.
- A contaminated target session should be discarded for diagnosis and not silently reused.

Why it matters:
- Over-broad contamination detection blocks valid runs.
- Under-broad detection lets poisoned sessions masquerade as role behavior.

### 4. Evidence Export Must Prefer One Bounded Authoritative Read Surface

Current issue:
- The canonical transcript artifact can lag behind the latest settled turn, while raw session data may be richer but harder to interpret safely.
- Current artifacts imply that the right answer is often session-derived evidence, but that logic still lives mostly as investigation outcome rather than as one explicit stable operator contract.

Required improvement:
- Tooling should expose one bounded evidence read path that clearly states when transcript evidence is authoritative, when session-derived evidence is authoritative, and why.
- Operators should not need to drop to raw JSON or long transcript export just to classify a Local tooling result.

Why it matters:
- If the evidence lane is unstable, the human and Anchor both spend effort diagnosing tooling state instead of the target behavior.

### 5. Selection Verification Must Match The Host Model

Current issue:
- Repo evidence shows that Local custom-agent sessions can persist the latest request under a built-in participant while still carrying the requested custom mode in a separate surface.

Required improvement:
- Verification must treat matching custom mode evidence as first-class selection evidence.
- Request participant fields should remain diagnostic, but should not hard-fail a valid custom-mode run by themselves.
- A verified selection, a mismatch, and an unverified selection should remain distinct outcomes.

Why it matters:
- Otherwise the tooling will misread the host persistence model and create false negatives during candidate work.

### 6. Cleanup And Interop Locks Need A Cleaner Failure Model

Current issue:
- Repo artifacts show cleanup friction such as self-targeting heuristics, transient `chat interop is already running` locks, and difficulty cleaning up disposable probe chats immediately after partial host completion.
- The availability of chat deletion lowers the cleanup burden, but it does not by itself prove that cleanup is always safe, ordered, or unambiguous under those host constraints.

Required improvement:
- Probe cleanup should have a clear ordered contract: close visible tab first, then delete artifacts when appropriate.
- If cleanup is blocked by a transient host lock, the tooling should report the remaining session explicitly rather than leaving cleanup state ambiguous.
- Self-targeting guards should prevent dangerous operations without also trapping routine same-chat follow-up or cleanup in unclear states.

Why it matters:
- Disposable probes that cannot be cleaned up cheaply increase UI noise, evidence confusion, and operator hesitation.

### 7. Manual High-Weight Comparison Is Still A Missing Gate

Current issue:
- The repo carries medium-weight evidence that cleaner tool-driven Local passes are possible, but also explicitly states that this is not equivalent to a clean manual high-weight Local pass.

Required improvement:
- The workflow should preserve one explicit manual clean-room comparison step for role-diagnostic slices that matter.
- Tooling should support that comparison rather than silently replacing it as the only evidence lane.

Why it matters:
- Without a manual comparison gate, role-design conclusions risk being drawn from a transport surface that is still only partially trusted.

### 8. Repo Artifact Coverage Around Tooling Is Still Too Fragmented

Current issue:
- Important tooling truths currently live across temporary investigations, recovery notes, workflow skills, and role-testing companions.
- That is enough to recover some state, but not enough to give one clean view of what the tooling can currently be trusted to do.

Required improvement:
- Maintain one explicit tooling evaluation or capability matrix artifact that states current support level, open gaps, and required pass criteria.
- Keep temporary run history and root-cause logs separate from that matrix.

Why it matters:
- If the current tooling state cannot be read quickly from repo artifacts, context loss will recreate the same drift after compaction or after a broken tooling period.

## Required Test And Use-Case Matrix

The tooling should not be considered ready for role-development support unless these cases are classifiable and passable.

### A. Exact Target Delivery

Use case:
- Send to a known Local session id and prove that the prompt landed in that exact session.

Must demonstrate:
- Correct target session id.
- No fallback to an unrelated active `Chat` tab.
- Clear classification if exact targeting is unavailable.

Failure to watch for:
- Wrong-thread landing masked as success.

### B. Clean Seed Create Followed By Real Prompt Send

Use case:
- Create a new Local probe chat, wait for the seed to settle, then send the real prompt.

Must demonstrate:
- The seed settles cleanly.
- The real prompt send is actually attempted.
- Success is never reported from a seed-only session.

Failure to watch for:
- False-green `ok` after seed token only.

### C. Same-Chat Follow-Up Continuity

Use case:
- After a first-turn Local probe, send a same-chat follow-up in the same target session.

Must demonstrate:
- The second prompt stays in the same target chat.
- No self-targeting guard blocks ordinary valid follow-up.
- No planning spill, TODO markers, or control-thread leakage appears across turns.

Failure to watch for:
- A first clean turn followed by contaminated or misrouted follow-up.

### D. Contamination Classification

Use case:
- Distinguish a clean run, a contaminated run, and an unjudged run.

Must demonstrate:
- Real control-thread artifacts trigger contamination.
- Ordinary host scaffold tags alone do not.
- Contaminated sessions are marked unusable for role diagnosis.

Failure to watch for:
- False contamination from ordinary scaffolding.
- False cleanliness when TODO or tool-governance spill is present.

### E. Selection Verification Under Host Persistence Model

Use case:
- Verify a Local custom-agent selection when built-in participant and custom mode surfaces differ.

Must demonstrate:
- Matching custom mode can verify the intended selection.
- Request participant remains diagnostic only.
- The tooling can separate `verified`, `mismatch`, and `unverified` cleanly.

Failure to watch for:
- Valid custom-mode runs rejected as mismatch.

### F. Settled Completion Recovery

Use case:
- Recover from a dropped or missing live completion signal by re-reading persisted evidence.

Must demonstrate:
- Recovery works only when the real prompt send is proven.
- Recovered success shows the settled assistant outcome.
- Recovery does not relabel seed-only or partially sent runs as full success.

Failure to watch for:
- Completion recovery that amplifies ambiguous state into fake certainty.

### G. Transcript Lag Fallback

Use case:
- The transcript file lags behind the latest settled assistant turn.

Must demonstrate:
- The evidence path falls back to session-derived evidence.
- The operator can still read a bounded final result.
- The tooling explains which evidence surface won and why.

Failure to watch for:
- Treating a partial transcript as authoritative when newer settled session evidence exists.

### H. Disposable Probe Cleanup

Use case:
- Close and optionally delete a probe-only Local chat after the result has been read.

Must demonstrate:
- Chat deletion can be invoked on the intended disposable probe rather than only existing as a nominal capability.
- Visible close happens before destructive cleanup.
- Remaining cleanup blockers are named explicitly.
- The operator can distinguish user-owned diagnosis chats from disposable probe chats.

Failure to watch for:
- Deleting artifacts while the visible chat is still open.
- Silent cleanup failure that leaves ambiguous residue.

### I. Manual Clean-Room Comparison

Use case:
- Compare one manual fresh Local candidate pass against one tool-driven pass for the same narrow slice.

Must demonstrate:
- The comparison uses the same slice and same-chat follow-up rule.
- The tooling result is classified as support evidence, not automatic role proof.
- Any divergence is attributed first to transport/setup versus role behavior.

Failure to watch for:
- Promotion of tooling-mediated evidence into role judgment without a manual anchor point.

## Minimal Agent-Driven Verification Gate

Use this gate before resuming role development when the open question is not only whether the tooling works in repo, but whether the active AI agent actually routes to the right Local chat workflow skill and uses the tooling with the intended safety model.

Run this gate in a fresh conversation so the result is not polluted by stale preloaded skill state from an older session.

### Gate 1. Create/Send Workflow Competence

Use case:
- Verify that the agent can start a dedicated Local probe chat with the maintained create/send workflow and continue in the same exact session without reintroducing broad `#agent` or repeated-agent follow-up habits.

Must demonstrate:
- The agent chooses the maintained create/send workflow surface rather than stale broad repo-side guidance.
- `create_live_agent_chat` produces a dedicated probe session with the requested agent outcome and expected first-message transport.
- A same-session follow-up uses `send_message_to_live_agent_chat` without `agentName` unless an intentional rebind is the point of the slice.
- Bounded persisted evidence confirms a real second request in the same target session.

Failure to watch for:
- Reusing the working chat instead of creating a dedicated probe.
- Repeating `agentName` on an ordinary follow-up.
- Normalizing focused fallback as if it were exact-session proof when the exact session id was already known.

### Gate 2. Persisted-Session Inspection Competence

Use case:
- Verify that the agent reaches for bounded persisted-session tooling first instead of dropping straight to raw session files.

Must demonstrate:
- The agent identifies the target session through bounded session tooling.
- The agent uses compact session reads such as snapshot, index, window, or bounded evidence export before any raw file read.
- The bounded read is sufficient to classify whether the create/send probe produced a real conversation, sparse bootstrap, or ambiguous evidence.

Failure to watch for:
- Raw `chatSessions/*.jsonl` reads as the first inspection move.
- Large transcript export or raw file dumping when a bounded read would answer the question.
- Confusing a sparse bootstrap stub with a real same-thread interaction.

### Gate 3. Exact Delete Competence

Use case:
- Verify that the agent can clean up the dedicated probe safely without widening the target set or threatening the working chat.

Must demonstrate:
- The agent confirms the exact disposable target session id before destructive cleanup.
- The agent treats visible-tab state as part of the delete lifecycle rather than deleting around it.
- If exact delete is blocked because a visible tab could only be matched heuristically, the agent first closes the tab explicitly and only then retries exact delete.
- The probe disappears from the live-chat list after cleanup, and any queued offline cleanup is named explicitly rather than silently assumed.

Failure to watch for:
- Prefix-id or title-based destructive targeting.
- Treating a delete blocker as a reason to widen the target set.
- Declaring cleanup success while the disposable probe is still reopenable as a live chat.

### Passing Rule

- Do not treat one strong-looking tool call as sufficient.
- The gate passes only when all three workflow classes succeed in the same fresh conversation with bounded evidence and safe cleanup.
- If one gate fails because of stale repo-side guidance, unresolved routing ambiguity, or host-state contamination, stop role development and repair that tooling/setup layer first.

### Current Known Host Note

- Current live evidence already supports a bounded create/send plus inspection plus exact delete slice, but the delete path can still block on a visible editor chat tab that is attributable only by title until that tab is explicitly closed.
- Treat that as a real host constraint in the current safety model, not as permission to weaken exact delete targeting.

## Current Operational Recommendation

- Treat Tiinex tooling as a valuable but still partially constrained support layer for role development.
- Use it to reduce friction, preserve bounded evidence, and expose transport faults earlier.
- Do not yet let it outrank high-weight manual Local evidence for Anchor Candidate diagnosis or promotion-gate judgment.
- When a tooling path is fallback-dependent, host-sensitive, or reload-sensitive, record that explicitly in the run summary rather than flattening it into a generic pass.
- Do not resume role development merely because the repo-side skill files look cleaner; resume only after the minimal agent-driven verification gate above passes in a fresh conversation.

## Repo-Level Gap This File Intentionally Closes

- Before this file, the repo carried tooling lessons mostly as scattered process and investigation signal.
- This file creates one explicit bridge between those signals and the practical question: what must the tooling reliably do before it helps more than it harms?
- Temporary run logs and root-cause notes may still live elsewhere, but the evaluation standard should remain compact and readable here.