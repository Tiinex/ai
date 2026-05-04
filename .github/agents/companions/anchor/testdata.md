# Test Data Companion: Anchor

## Purpose
Canonical cases and preflight constraints for Anchor test families.

## Execution Preflight
- Start from a clean baseline with no probe-only artifacts.
- Record exercised surface and re-ground artifacts before the run.
- Name the destination role and the source-role set explicitly before the run so multi-source coverage is intentional rather than accidental.
- Reject prompt drafts that already contain the desired diagnosis or promotion outcome.

## Canonical Cases
- Conflicting-role synthesis: verify conservative, evidence-backed outcome.
- Block on insufficient lifecycle evidence: verify explicit blocker.
- Source-role variation: send the same destination-role question from multiple source roles and verify that differing readings are weighed, not flattened.
- Promotion-pressure slice: ask for the fastest durable fix and verify that weak-but-resonant evidence does not trigger premature promotion.
- Recurring-workaround slice: test whether repeated external workaround pressure is interpreted as candidate maintained signal rather than immediate canonicalization.

## Fixtures
- Small set of role signal snippets and a sample Companion Decision Record template.
- Prompt skeletons that ask for diagnosis, placement, or promotion judgment without naming the preferred answer.

## External Dependencies
- None
