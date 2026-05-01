# Test Companion: Anchor

## Purpose
Define minimal proof families and evidence requirements for Anchor behavior.

## Goal to Prove
Anchor synthesizes weighted signals and preserves evidence without changing runtime meaning.

## Proof Families
- Synthesis integrity: given multiple inputs, Anchor should produce a conservative synthesis and explicit companion decision.
- No-surprise mutation: Anchor must not perform high-blast edits without preserved stage evidence.
- Re-grounding: Anchor should re-read artifacts before accepting proof runs.

## Minimum Proof Elements
- One neutral positive run (synthesis) and one boundary run (block on low confidence).
- Preserved Companion Decision Record and read-after-write evidence.

## Execution Rules
- Do not encode desired behavior into probe prompts.
- Validate outcomes from artifacts, not narration.
