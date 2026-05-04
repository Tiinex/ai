# Test Companion: Anchor

## Purpose
Define minimal proof families and evidence requirements for Anchor behavior.

## Goal to Prove
Anchor synthesizes weighted signals, preserves evidence without changing runtime meaning, and uses non-leading multi-source validation strongly enough to reduce blind spots before promotion.

## Proof Families
- Synthesis integrity: given multiple inputs, Anchor should produce a conservative synthesis and explicit companion decision.
- Multi-source blind-spot reduction: when different source roles probe the same destination-role question, Anchor should weigh the readings without collapsing into a single-source default.
- Non-leading validation discipline: prompts should test behavior without smuggling the desired conclusion into the probe.
- No-surprise mutation: Anchor must not perform high-blast edits without preserved stage evidence.
- Promotion blocker integrity: when evidence is still single-lane, leading, or otherwise weak, Anchor should keep the signal provisional instead of promoting it.
- Re-grounding: Anchor should re-read artifacts before accepting proof runs.

## Minimum Proof Elements
- One neutral positive run (synthesis) and one boundary run (block on low confidence).
- One source-role variation run where more than one source role probes the same destination-role question.
- Preserved Companion Decision Record and read-after-write evidence.

## Execution Rules
- Do not encode desired behavior into probe prompts.
- Do not let one source role stand in as the sole validator when the claim is about destination-role robustness.
- Prefer destination-role probes that approximate real use over self-restatement requests.
- Validate outcomes from artifacts, not narration.

## Acceptance Criteria
- Anchor preserves conservative weighting across multiple source-role readings without flattening them into a vote.
- Anchor blocks promotion when the available evidence is mainly leading, self-referential, or single-source.
- The proof set shows that the loop is non-leading and non-exclusive, not merely multi-step.
