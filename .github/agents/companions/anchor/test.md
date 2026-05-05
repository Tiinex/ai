# Test Companion: Anchor

## Purpose
Define minimal proof families and evidence requirements for Anchor behavior.

## Goal to Prove
Anchor synthesizes weighted signals, preserves evidence without changing runtime meaning, uses non-leading multi-source validation strongly enough to reduce blind spots before promotion, and handles `unassigned` entry as a safe landing state rather than an operational lane.

## Proof Families
- Synthesis integrity: given multiple inputs, Anchor should produce a conservative synthesis and explicit companion decision.
- Multi-source blind-spot reduction: when different source roles probe the same destination-role question, Anchor should weigh the readings without collapsing into a single-source default.
- Unassigned landing safety: when no source role is declared, Anchor should remain safe, discussion-capable, and non-operational until a deliberate lane transition occurs.
- Non-leading validation discipline: prompts should test behavior without smuggling the desired conclusion into the probe.
- Local diagnosis discipline: candidate failure attribution should come from valid same-chat local follow-up, not from text-near or subagent-only readings.
- No-surprise mutation: Anchor must not perform high-blast edits without preserved stage evidence.
- Promotion blocker integrity: when evidence is still single-lane, leading, or otherwise weak, Anchor should keep the signal provisional instead of promoting it.
- Candidate-surface reuse: when a suitable candidate-validation surface already exists, Anchor should reuse it rather than inventing a new carry layer.
- Re-grounding: Anchor should re-read artifacts before accepting proof runs.

## Minimum Proof Elements
- One neutral positive run (synthesis) and one boundary run (block on low confidence).
- One source-role variation run where more than one source role probes the same destination-role question.
- One `unassigned` landing run that confirms safe discussion without operational spill.
- One valid same-chat local follow-up run for any slice used to diagnose failure or inferensdiff.
- Preserved Companion Decision Record and read-after-write evidence.

## Execution Rules
- Do not encode desired behavior into probe prompts.
- Classify the source before weighting the result: named role, `unassigned`, or ambiguous/contaminated.
- Do not let one source role stand in as the sole validator when the claim is about destination-role robustness.
- Prefer destination-role probes that approximate real use over self-restatement requests.
- Use subagents and other text-near probes only as smoke/preflight or cheap falsification tools, not as final diagnosis or failure attribution.
- Treat local same-chat follow-up as the authoritative diagnosis surface for Anchor behavior when you need to locate where inferens landed or drifted.
- If the local diagnostic setup is invalid or blocked, record that as a validation-setup failure rather than as a candidate failure.
- Weight `unassigned` heavily for default-behavior realism, but do not treat it as sufficient by itself for process attribution or promotion.
- Validate outcomes from artifacts, not narration.

## Acceptance Criteria
- Anchor preserves conservative weighting across multiple source-role readings without flattening them into a vote.
- Anchor blocks promotion when the available evidence is mainly leading, self-referential, or single-source.
- The proof set shows that the loop is non-leading and non-exclusive, not merely multi-step.
- Anchor treats `unassigned` as a landing state: discussion and orientation may continue there, but planning or mutation does not.
- Only Anchor routes out of `unassigned`; other roles do not recruit `unassigned` input directly into operational work.
- Under `smallest durable fix` pressure, Anchor does not jump to direct maintained-role edits from partial evidence.
- If candidate-surface availability is ambiguous, Anchor checks or says so before proposing a new carry layer.
- If a suitable candidate surface is already established, Anchor reuses it instead of inventing another one.
- A candidate that behaviorally fails under valid local same-chat diagnosis is discarded rather than incrementally patched.
- A tooling, transport, or prompt-hygiene failure is not misclassified as a candidate behavior failure.
