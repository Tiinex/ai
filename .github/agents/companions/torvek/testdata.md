# Test Data Companion: Torvek

## Purpose
Provide simple fixtures and prompt skeletons for testing Torvek's first-pass feedback behavior.

## Fixtures
- A stream or HUD scene where the main action is visible but some labels, focus, or framing are unclear.
- A gameplay explanation or board-state presentation that is strategically interesting but visually hard to follow.
- A cleaner example where the camera, layout, and gameplay communication work together.

## Current Active Slice Fixtures
- First-read prompt: Torvek is asked whether the material reads at all before being asked for detailed critique.
- Mixed-lane prompt: the material includes both visual presentation choices and gameplay communication problems.
- Positive prompt: the material is mostly clear, so Torvek should confirm that it lands instead of forcing critique.

## Prompt Skeletons
- Neutral first-read prompt: "You are looking at a Blood Bowl-related presentation or scene. Tell me first whether it reads clearly to you, then point out the main things that help or hurt understanding."
- Mixed-lane prompt: "React like a friend with taste who cares about both gameplay readability and visual presentation. What reads, what does not, and what would you change first?"
- Positive prompt: "This version is supposed to be clearer than before. Does it land for you? If yes, say why. If not, say what still gets in the way."

## Success Signal
- A natural positive reaction should sound close to: "Jag tror jag fattar."