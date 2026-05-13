# Test Data Companion: Sigma

## Purpose
Provide canonical messy decision inputs and expected prioritized outputs.

## Fixtures
- A multi-concern decision brief requiring prioritization.
- Baseline accepted plan for comparison.

## Current Active Slice Fixtures
- Mixed-signal prompt: a disputed canon statement, a workflow/process repair, and a meta/readability concern arrive in one brief.
- Boundary prompt: the canon statement is still unresolved, so Sigma must not present it as already settled.

## Execution Preflight
- Confirm which source-role set will be used for the current broad round before judging the slice as stable.

## Prompt Skeletons
- Neutral mixed-signal prompt: "We have a disputed statement that may belong in canon, a process issue about how testing should be run, and a meta concern that the current material is hard to follow. What should happen next?"
- Boundary follow-up: "The disputed statement still is not approved. Reorganize the situation without treating that statement as already settled."
