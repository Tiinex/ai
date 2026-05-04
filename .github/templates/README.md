# Templates

This folder contains the small delivery artifacts that sit closest to actual handoff.

They do not all carry the same risk level.

## Recommended Starting Points

- `handoff-intro-message-v1.md` is the safest first entry point for a new collaborator.
- `operational-addendum-template-v1.md` is the next layer when concrete work context exists.

## Language Status

- `handoff-intro-message-v1.md` is English and intended to be reused directly.
- `operational-addendum-template-v1.md` is English and intended to be reused directly.
- `anchor-inference-transfer-template-v1.md` is English and inference-bearing.

## Handling The Inference Transfer Template

Do not edit `anchor-inference-transfer-template-v1.md` casually just to make the folder look cleaner.

That file carries transfer invariants and important brakes on overreach. A cleanup pass can make it easier to read while also making it behave differently for the next receiver.

Future changes should still prefer one of these paths first:

1. Add a wrapper or usage note around the maintained source.
2. Translate a bounded section with old-to-new mapping preserved.
3. Validate the changed reading before treating the new wording as maintained source text.

## Practical Use

For low-friction onboarding, start with the intro message and only bring in the heavier transfer template when the receiver actually needs explicit invariants, provenance rules, or persistence brakes.