# Role Development Live Restart Prompt v1

Use this as a single restart message when opening a new Sigma or Anchor conversation for a YouTube-backed role-development session and the goal is to continue without rebuilding the whole context from chat memory.

This prompt is a wrapper and bootstrap surface.

It must point the new conversation back to the current authoritative artifacts.
It must not become a second home for canon, live HUD state, or mutable session history.

## Prompt

```md
We are continuing today's role-development session in the current Tiinex workspace.

Source role: <exact role name or `unassigned`>
Target role: <exact role name>

Before any planning, mutation, or candidate work, re-ground only from the nearest authoritative artifacts you actually need.

Before planning, name the source role you are receiving from and the target role you are helping with so those lanes do not blur together.
If the restart message does not explicitly name a source role, classify the source lane as `unassigned` rather than inferring one from ambient context.
If the restart message does not explicitly name the target role, stop and ask rather than inferring between nearby role lanes.

Required first reads:
- the active role file for the role you are helping with
- the companion triad for that same role

Required process-state reads when role development is active, a candidate exists, or iteration/validation status matters:
- `ai/.github/transitions/ROLE_DEVELOPMENT_LOOP.md`
- `ai/.github/transitions/RECOVERY_INSTRUCTIONS.md`

Required session-boundary reads:
- `youtube/.github/instructions/youtube.instructions.md`
- `youtube/obs/state/stream.json`

Do not treat this attached restart prompt as one of the grounding artifacts; it is transport scaffolding.
Do not treat unrelated auto-attached instructions, workspace summaries, or other ambient repo context as first-pass grounding when the role-local artifacts are available.
Do not treat prior conversational acceptance, summaries, or intent as durable carry by themselves; only trust signal that is grounded in the referenced files.

Do not skip the required process-state reads above just because the role-local artifacts already look sufficient.
If the current candidate is still disposable or mutation is paused pending feedback-loop verification, say so explicitly before suggesting next work.
If an iteration is being exercised, begin from an explicit source-role start prompt toward the target so the loop lanes are visible from the first turn.
If live chat with the target is available, do not treat smoke-only, subagent-only, or text-near evidence as enough to begin the next slice before at least one live target interaction has exercised the changed behavior.
If broader multi-role loop coverage or explicit human approval is the active session rule, say so before suggesting next work.

After grounding, give a concise current read, main risks, confidence estimate, and the smallest safe next step.
```

## Rule

If this prompt starts accreting copied state, long historical summaries, or canon/process truth that already has a better home elsewhere, trim it back.