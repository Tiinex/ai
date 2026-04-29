---
name: chatgpt-cloud-project-testing
description: 'Test ChatGPT Cloud Projects against uploaded zip context. Use when refreshing PROJECT_CONTEXT.zip, clearing project chats, probing source readability, testing destination-role boot behavior, or running cross-role and multi-step cloud validation in the integrated browser.'
argument-hint: 'Destination role or test slice to validate, for example: Echo cold start, Anchor drift probe, or source readability.'
user-invocable: false
---

# ChatGPT Cloud Project Testing

Use this skill for repeatable ChatGPT Cloud Project tests in the real destination environment.

This is a workflow skill, not a role definition. Keep role identity, canon protection, and weighting logic in the role files and project artifacts. Use this skill only to run and interpret cloud tests.

## When To Use

- Refresh the uploaded project zip before cloud validation.
- Clear project chats to force a real cold start.
- Check whether project `Sources` are actually readable in a fresh chat.
- Test how a destination role boots from different entry formats.
- Compare direct role address, cross-role address, and multi-step follow-up behavior.
- Distinguish UI/upload problems from role-behavior problems.

## Guardrails

- Treat user testing habits as strong workflow feedback, not automatic canon.
- Treat platform and language as validation dimensions for the same maintained role identity, not as proof that separate role variants should exist.
- Do not move this routine into role files.
- Prefer project-root operations over chat-level operations when resetting state.
- Prefer non-destructive chat hygiene by default: create a dedicated fresh test chat for each slice, read the result fully, then delete only that test chat when cleanup is needed.
- Do not mass-delete existing project chats unless the project is explicitly a disposable test surface or the user has clearly approved project-wide chat deletion.
- If the surrounding project has enough existing conversation state that you can no longer judge contamination risk confidently, stop treating the project as a routine test surface and make that risk explicit before continuing.
- When that risk is visible but still partly mitigable, Anchor may continue only if the user is aware of the contamination risk and the remaining mitigation path is concrete, bounded, and non-destructive.
- If that threshold is crossed and clean interpretation still matters, prefer recommending a separate empty project for testing over forcing a destructive reset inside the active project.
- Use this workflow autonomously only when the destination project or live cloud surface is explicit in the repo or the user has clearly approved that target.
- If the destination is ambiguous, or if permission for chat deletion, source replacement, or live-cloud mutation has not been made clear, ask before proceeding.
- If the integrated browser is not authenticated and shows a sign-in wall, logged-out surface, or other auth gate instead of the project UI, stop and ask the user to sign in before treating the page as evidence or attempting live mutation.
- If no suitable target project exists, or the current one is too contaminated or inappropriate for the test, recommend a fresh dedicated project and help the user prepare the next step once that target is explicit.
- Separate three questions during interpretation:
  1. Was the zip refreshed successfully?
  2. Were project sources readable in a new chat?
  3. Did the destination role behave correctly once sources were readable?
- Do not overfit role text from a single failed cloud test if source readability was not first confirmed.

## Preconditions

- The current browser surface is authenticated and can reach the actual ChatGPT project UI.
- The current project page is reachable in the integrated browser.
- A fresh export zip exists, typically `dist/PROJECT_CONTEXT.zip`.
- The project root page, not only an individual chat URL, is available for resets.
- A suitable target project exists, or a fresh dedicated project has been chosen explicitly.

## Live Sync Routine

When repo changes affect cloud behavior, treat the live project as having two separate context surfaces that must be synchronized deliberately:

1. Confirm that the browser is authenticated and that the intended project exists.
2. Rebuild `dist/PROJECT_CONTEXT.zip` from the current repo.
3. Refresh the uploaded zip in project `Sources`.
4. Open `Project settings` and sync the live `Instructions` text with `CLOUD_CHAT_GPT_PROJECT_ECHO_PRE_PROMPT.md`.
5. Save the settings explicitly.
6. Start a dedicated new chat for the next distinct test slice instead of reusing an earlier thread.
7. After the result has been fully read and logged, delete only that dedicated test chat when cleanup is needed.
8. If cleanup is intended, perform that deletion before starting the next dedicated test chat so old test slices do not accumulate by accident.
9. Rerun the source-readability or destination-role probe in that fresh chat.
10. When resuming after compaction, handoff, or a long autonomous batch, explicitly verify that the previous dedicated test chat is actually gone before starting the next slice.

If zip, live `Instructions`, and chat state are not all fresh, treat the result as potentially contaminated before drawing role-level conclusions.

Use the operational checklist in [live sync checklist](./assets/live-sync-checklist.md) when you need the exact sequence and contamination checks, not just the summary rule.

## Navigation Heuristic

When the browser is sitting inside a specific project chat or the sidebar state is noisy, prefer this recovery path over local menu hunting:

1. Navigate directly to `https://chatgpt.com/projects`.
2. Find the target project from the projects list.
3. If needed, use the projects search box and wait a short moment for live filtering to settle.
4. Enter the project from that list view, then continue with reset or validation.

This path is often faster and less brittle than trying to recover state from a deep chat URL or from project-option buttons inside the sidebar.

If the projects list itself cannot be reached because the surface is logged out or auth-gated, stop there and ask the user to sign in before continuing.

Fallback when direct navigation is unavailable or the browser must stay in-place:

1. Scroll the sidebar to the top.
2. Click `Projects`.
3. Continue from the same project-list flow above.

## Core Procedure

### 1. Reset To A Clean Project State

1. Open the project root page.
2. If the intended project does not exist or is no longer a safe test surface, stop and recommend a fresh dedicated project before continuing.
3. Create a dedicated new chat for the current test slice rather than reusing an earlier thread.
4. Delete only that dedicated test chat after the output has been fully read when you want the slice cleaned up.
5. If you are running another slice immediately after cleanup, delete the previous dedicated test chat before creating the next one.
6. Reserve project-wide chat deletion for disposable test projects or explicitly approved destructive resets.
7. Move to the `Sources` tab.
8. Remove the old zip if it is present.
9. Upload the fresh `PROJECT_CONTEXT.zip`.
10. Verify that the zip appears in the `Sources` list before starting a new chat.

Heuristics from observed UI behavior:

- A logged-out or auth-gated preview is not a flaky project state; it is a hard blocker until the user signs in.
- Chat and source action menus may require hover before the action button becomes safely clickable.
- Deletion usually requires a confirmation dialog.
- On this UI, the wrong file input can attach a file to the composer instead of project `Sources`; verify the zip lands in the `Sources` list, not in the message composer.
- The project's `Instructions` in `Project settings` are a separate live control surface from the uploaded zip and can silently go stale.
- If cloud behavior does not match the current repo pre-prompt, inspect `Show project details` -> `Project settings` and verify the live `Instructions` text is actually synchronized with `CLOUD_CHAT_GPT_PROJECT_ECHO_PRE_PROMPT.md`.
- On the current UI, the fastest route into `Project settings` is to click the project title text next to the icon in the project header. Do not click the icon itself.
- Treat `Show project details` -> `Project settings` as the fallback path when the title shortcut is unavailable or unstable.
- When replacing live `Instructions`, replace the full field contents rather than appending to the existing text.
- A reliable operator sequence on this UI is: focus the `Instructions` field, `Ctrl+A`, paste the full repo-side pre-prompt, then save explicitly.
- Treat the `Save` button itself as evidence that a real edit was registered. If `Save` does not appear or is not enabled, assume the live `Instructions` did not change and do not treat the sync as complete.
- If no real edit was registered, close the panel and classify the attempt as a no-op rather than a successful partial sync.

Heuristics from observed chat execution behavior:

- Do not rely on the button label alone as the completion gate; on this UI, labels can lag or vary while the control state is still changing.
- The more stable signal is the composer icon state:
  - send arrow before generation starts
  - stop square while generation is active
  - send arrow again when generation has actually returned to idle
- Treat a turn as still running until the stop/square state disappears and the ordinary send arrow has returned.
- After the arrow returns, also check whether the send button is disabled because the input is empty versus enabled because unsent text remains; both are idle states, but only the disabled-empty state is a clean post-send baseline.
- Do not send the next follow-up while the stop/square state is still present, even if the visible response already looks mostly complete.
- After a response completes, scroll enough to see the full tail of the answer before concluding whether the behavior actually passed or failed.

### 2. Run A Source Readability Probe

Run one explicit probe first. The goal is not elegant behavior; the goal is to determine whether the project can actually read uploaded sources in this fresh chat.

Use a prompt from [prompt templates](./assets/prompt-templates.md).

Success signal:

- The response references a concrete file inside the uploaded context, not just the zip container.

Failure signal:

- The response says the source is unavailable, unreadable, or not yet visible in the chat.

Interpretation:

- If this probe fails, stop treating later role behavior as evidence about the role.
- First classify the failure as upload/index/readability before changing prompts or role files.

### 3. Run Destination-Role Entry Tests

After readability passes, test one destination role at a time.

Recommended order:

1. Neutral cold start with no sender role.
2. Direct address to the destination role.
3. Cross-role entry from each other role into the destination role.
4. One follow-up turn to test persistence without hidden chat leakage.

Start with a star pattern, not a full pairwise matrix:

- Destination role in center.
- Every other role acts as sender toward that destination.

Example:

- Echo as destination:
  - neutral boot
  - `Hej Echo`
  - `Hej Echo, Sigma här ...`
  - `Hej Echo, Leo här ...`
  - `Hej Echo, Orbit här ...`
  - `Hej Echo, Anchor här ...`

Do the same later for Anchor, Sigma, Leo, or Orbit when they become the destination role under test.

### 4. Expand To Interaction Tests

Only move here after simple entry tests are stable.

Recommended ladder:

1. Multi-step follow-up with the same destination role.
2. Handoff between roles across turns.
3. Multiple sender roles in one message.
4. Mixed feedback or mild conflict between sender roles.
5. Multilingual prompts that check whether the role keeps the same weighting and source discipline across user languages.
6. Receiver-guided diagnosis when a live result is ambiguous but still concrete enough to classify.
7. Cross-destination replication of the same small slice before treating a passing pattern as destination-agnostic.

This keeps failures interpretable. If multi-role prompts are tested too early, source failures, role boot failures, and conflict-resolution failures blur together.

When multilingual behavior matters, keep the probe constant in intent and vary only the user language. First verify that the response still:

- answers in the user's language
- names concrete files it actually read when the probe asks for that
- keeps the same role discipline and does not silently relax canon or persistence brakes

When you need a compact robustness matrix, use: destination role x execution surface x current-turn user language. Hold task intent constant and vary one axis at a time so failures stay classifiable.

If a fresh English or other non-Swedish first turn still answers in Swedish even while concrete file reading passes, do not treat that as a role-only failure by default. First suspect the live project bootstrap or `Instructions` language weighting, especially when the bootstrap text itself is Swedish or mixed-language.

The current best repair path for that pattern is to strengthen the live bootstrap language override inside `CLOUD_CHAT_GPT_PROJECT_ECHO_PRE_PROMPT.md` and resync the full `Instructions` field. Put the override high enough in the bootstrap that it can influence the first substantive answer, and make it explicit that the reply language should follow the current user turn rather than the bootstrap language, project-default language, or an earlier dominant thread language.

Do not treat one clean multilingual pass as enough to prove language stability over time when the prompts themselves explicitly specify the response language. After that first pass, run one bounded same-thread drift slice that removes explicit `reply in X` steering and alternates user languages across turns. If the model keeps defaulting to an earlier dominant language, answers a fresh English turn in Swedish, or continues one language across later foreign-language turns even while concrete file reading still passes, classify that as language-following instability under longer or thinner multilingual pressure rather than as a source-readability failure.

After applying that bootstrap repair, do not stop at a single first-turn pass. Recheck the same early-turn prompt on at least one other destination role, then run one bounded same-thread multilingual drift slice before treating the fix as stronger than a narrow working hypothesis.

When a live result is ambiguous but not empty, prefer one bounded diagnosis turn before editing role files or widening the test surface. In that diagnosis turn:

- give the receiving role the concrete observed pattern, not a summary like "it felt off"
- ask it to choose the most likely failure mode from the existing workflow categories and name that category verbatim before any extra explanation
- ask for the smallest next falsifying check that can separate that diagnosis from its nearest alternative
- keep the turn process-bound and reversible; do not let the diagnosis itself become new canon or workflow law

When you are intentionally probing thin or broken-context starts, do not count a merely plausible or helpful answer as project-grounded evidence by tone alone. Use one immediate follow-up that asks whether any project file was actually read in that thread and, if yes, to name exactly one file. Do this even if the first answer already names a file, because thin prompts can still produce file-shaped references from reconstruction rather than actual readout. If the model cannot name a file, asks the user to provide project context instead, says no file was read, or later admits the file reference was reconstructed rather than read, treat that slice as a source-engagement failure for that prompt shape rather than a role-level pass.

If that thin-prompt check fails, do not assume the next-smallest repair is universal. Some prompt families recover when you require an exactly named file, while others still remain source-free until you explicitly tell the model to read a project file first and only then answer the substantive question. Treat the smallest successful recovery step as family-specific evidence until reproduced elsewhere.

When one destination role passes a small but meaningful interaction slice, do not immediately treat that as a general workflow property. First rerun the same minimal slice on at least one other destination role. A good default is:

- one direct boot that checks concrete file reading plus role-shaped output
- one follow-up turn that adds pressure without explicit role switch and checks continuity

Only after that cross-destination replication should you start treating the pattern as stronger workflow evidence rather than a single-role win.

## Evidence Rules

- Highest-confidence evidence is behavior in the real ChatGPT Cloud Project.
- Local subagent smoke tests are useful, but they do not override cloud behavior.
- A passing result should capture what file was read, what role booted, and what concrete behavior supports that conclusion.
- When a live finding has enough evidence to survive out-of-chat use, artifact it promptly in the smallest relevant process file, checklist, or maintained note rather than leaving it only in chat state.
- Prefer low-friction artifacting of observed workflow findings over waiting for a cleaner later rewrite when compaction or chat turnover could erase the useful signal.
- A failing result should state whether the failure is most likely:
  - source refresh failure
  - source readability/indexing failure
  - source engagement failure on thin prompt
  - boot phrasing failure
  - destination-role discipline failure
  - multi-role ambiguity failure

## Interpretation Guide

- Explicit readability probe fails and soft boot fails:
  - treat as a source/readability problem first
- Explicit readability probe passes but soft boot fails:
  - treat as boot phrasing or role-behavior problem
- Simple cross-role boot passes but multi-step follow-up fails:
  - treat as continuity or persistence problem
- Single-sender tests pass but multi-role same-message tests fail:
  - treat as ambiguity or weighting problem, not necessarily a source problem
- Readability and first boot pass but a later follow-up starts mixing roles, forgetting prior distinctions, or inflating confidence:
  - treat as a continuity/persistence or destination-discipline problem first, then use one bounded diagnosis turn to choose the next smallest check

## Stop Conditions

- Stop escalating complexity when the current layer is still ambiguous.
- Do not move from baseline to multi-role tests if source readability has not passed.
- Do not patch role files from a single cloud failure when the failure may still belong to the workflow layer.
- Pause when the amount of surrounding project chat state makes contamination hard to bound, even if the current slice itself was started in a fresh dedicated chat.
- If the user is not yet aware of that risk, surface it before continuing.
- If the user is aware and the mitigation remains bounded, non-destructive, and still interpretable, Anchor may continue on that narrower basis.
- If those conditions are not met, recommend switching to a separate empty project rather than widening destructive cleanup in the current one.

## Current Project Preference

For this project, the current direction is:

- keep the test workflow outside the role files
- use cloud cold starts as the main acceptance surface
- prefer per-slice fresh chats plus targeted cleanup over project-wide chat clearing
- test one destination role against the other sender roles before expanding to full-system matrices
- treat multi-role same-message prompts as a later realism layer, not the baseline

## Resources

- [Prompt templates](./assets/prompt-templates.md)
- [Live sync checklist](./assets/live-sync-checklist.md)