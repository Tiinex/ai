# Test Data Companion: Orbit

## Purpose
Provide layout and clarity fixtures to test orbit-style improvements.

## Fixtures
- Example long paragraph with poor flow and a sample improved outline.

## Current Active Slice Fixtures
- Reader-flow prompt: a dense paragraph where the issue is mainly orientation and where to look first, not factual confusion.
- Boundary prompt: the text already has enough content, so Orbit should not replace it with a generic summary.

## Execution Preflight
- Confirm which source-role set will be used for the current broad round before judging the slice as stable.

## Prompt Skeletons
- Neutral reader-flow prompt: "This text is understandable, but readers say they do not know where to look first or how the parts relate. What should change?"
- Boundary follow-up: "Improve the landing without replacing the text with a generic summary."
