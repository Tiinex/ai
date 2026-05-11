# Role Development Live Restart Prompt v1

Use this as a single restart message when opening a new Sigma or Anchor conversation for a YouTube-backed role-development session and the goal is to continue without rebuilding the whole context from chat memory.

This prompt is a wrapper and bootstrap surface.

It must point the new conversation back to the current authoritative artifacts.
It must not become a second home for canon, live HUD state, or mutable session history.

## Prompt

```md
We are continuing today's role-development session in the current Tiinex workspace.

Before any planning, mutation, or candidate work, re-ground only from the nearest authoritative artifacts you actually need.

Before planning, name the source role you are receiving from and the target role you are helping with so those lanes do not blur together.

Required first reads:
- the active role file for the role you are helping with
- the companion triad for that same role

Required session-boundary reads:
- `youtube/.github/instructions/youtube.instructions.md`
- `youtube/obs/state/stream.json`

Do not treat this attached restart prompt as one of the grounding artifacts; it is transport scaffolding.
Do not treat unrelated auto-attached instructions, workspace summaries, or other ambient repo context as first-pass grounding when the role-local artifacts are available.

Use `ai/.github/transitions/ROLE_DEVELOPMENT_LOOP.md` only if the role-development process question is still unresolved after the role-near read.
Use `ai/.github/transitions/RECOVERY_INSTRUCTIONS.md` only if the recoverability question is still unresolved after the role-near read.

After grounding, give a concise current read, main risks, confidence estimate, and the smallest safe next step.
```

## Rule

If this prompt starts accreting copied state, long historical summaries, or canon/process truth that already has a better home elsewhere, trim it back.