# Test Data Companion: Parallax

## Purpose
Canonical cases and prompt skeletons for the Parallax role.

## Execution Preflight
- Start from a clean baseline with no cached claim about the role's authority.
- Name whether the slice is project-state, market or ecosystem, portability, or topic-bound before the run.
- If the slice is market or ecosystem shaped, gather two external sources or treat the run as incomplete by default.
- If the slice is topic-bound, inspect the current review state before proposing any mutation.
- Reject prompt drafts that already imply the preferred conclusion.

## Canonical Cases
- Blind-spot interview slice: Parallax interviews one or more roles and surfaces a contradiction or weak assumption instead of echoing the local narrative.
- Repo-first grounding slice: Parallax starts a project-state judgment from repo or runtime evidence rather than from role testimony alone.
- Two-source ecosystem slice: Parallax blocks or downgrades an ecosystem claim until two external sources support it.
- Host-dependence slice: Parallax names when a supposedly portable claim is still too VS Code-shaped.
- Bounded topic-review slice: Parallax inspects feedback review state and records only a bounded role review or bounded evidence item.
- Stale-marker slice: Parallax marks one specific retained topic message or evidence item stale when current proof no longer supports it cleanly.
- Category-correction slice: Parallax reuses an existing bounded badge such as `out-of-topic` or `reference-only` when a retained topic part is miscategorized.
- Authority-boundary slice: Parallax explicitly says that canon, drift-control, taste correction, implementation, or routing belong elsewhere.
- Experimental follow-up slice: after a lifecycle swap, Parallax answers one short exact-session follow-up that defines safe experimental reuse without claiming promotion.

## Fixtures
- Small set of role-transport packets with mixed confidence and evidence quality.
- Small set of external-source snippets for market or ecosystem comparison.
- Small set of repo-local claims that are tempting to overstate beyond current proof.

## Prompt Skeletons
- Blind-spot interview probe: `Interview the most relevant roles for this direction and return only the blind spots, contradictions, or missing proof that still matter.`
- Repo-first grounding probe: `Pressure-test this claim about the current project. Start from repo or runtime evidence, then weigh any role testimony separately.`
- Ecosystem reality probe: `Assess whether this move strengthens or weakens the surrounding ecosystem. Use at least two external sources before speaking with confidence.`
- Host-dependence probe: `Pressure-test whether this claim is genuinely platform-, model-, and language-agnostic or still too host-bound to say that honestly.`
- Topic-review probe: `Inspect the current feedback review state for this topic, then record only a bounded role review or bounded evidence item from the Parallax lane.`
- Stale-marker probe: `Inspect the topic and mark only the specific retained message or evidence item stale if current proof has weakened. Include a bounded reason and, when available, a proof reference or renewal cue. Do not touch gate fields.`
- Category-correction probe: `Inspect the topic and, if a retained message or evidence item is in the wrong category, reuse the existing bounded badge vocabulary to mark only that exact part out-of-topic or reference-only. Include a bounded reason and do not touch gate fields.`
- Authority-boundary probe: `Tell me what this role can say here without taking canon ownership, drift-control ownership, implementation ownership, or lane-routing ownership.`
- Experimental reuse probe: `Keep this short and bounded. Say when Parallax is safe to use in feedback-loop work while it remains experimental, and when it should stay out. Keep the lane limited to bounded role-review or evidence only and do not claim promotion.`

## Cross-Exam Packet Template
```md
## Cross-Exam Packet
- Claim class: <observed | inferred | proposed>
- Claim: <short claim>
- Repo or runtime evidence: <bounded evidence or none>
- Role-interview evidence: <bounded evidence or none>
- External evidence: <bounded evidence or none>
- Contradiction or blind spot: <what does not land cleanly>
- Falsifier: <what would disprove the current read>
- Risk if ignored: <why the gap matters>
- Recommendation: <bounded next move>
- Confidence: <0-100>
```

## Companion Decision Record Template
```md
## Companion Decision Record
- companion_target_role: Parallax
- exercised_slice: <blind-spot interview | repo-first grounding | ...>
- source_classification: <project-state | market/ecosystem | portability | topic-bound>
- outcome: <SETUP FAIL | CANDIDATE FAIL | CANDIDATE PASS / PROMOTION BLOCKED | PROMOTION READY>
- promotion_status: <blocked | ready | not-applicable>
- evidence_gap: <none | short description>
- evidence_links:
	- <artifact URL + SHA or local note>
```