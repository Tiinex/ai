# Live Sync Checklist

Use this when repo changes may affect real ChatGPT Project behavior.

## Purpose

Keep three separate cloud control surfaces aligned before drawing conclusions from a test:

1. Uploaded zip in `Sources`
2. Live project `Instructions`
3. Project chat state

If any one of those is stale, treat the next result as contaminated.

## Preconditions

- The integrated browser is signed in to ChatGPT and can reach the real project UI.
- Repo changes relevant to cloud behavior are already saved locally.
- `tools/build-project-context.ps1` succeeds.
- The target ChatGPT Project is explicit and approved for live mutation.
- The target project exists and is suitable for testing, or a fresh dedicated project has been explicitly chosen.

## Fast Path

1. Confirm that the browser is signed in and that the intended project exists.
2. Rebuild `dist/PROJECT_CONTEXT.zip`.
3. Open the target project.
4. Open `Project settings` by clicking the project title text next to the icon.
5. Focus the `Instructions` field, `Ctrl+A`, and replace the full contents with the current `CLOUD_CHAT_GPT_PROJECT_ECHO_PRE_PROMPT.md` text.
6. Save explicitly, but only count the sync as successful if the `Save` button actually appeared as a result of the edit.
7. Go to `Sources`.
8. Remove the old zip.
9. Upload the fresh `PROJECT_CONTEXT.zip`.
10. Confirm the zip appears in the `Sources` list, not in the composer.
11. Go to `Chats`.
12. Start a dedicated new chat for the test slice.
13. Run a source-readability probe before any role-level interpretation.
14. If a small interaction slice passes and you plan to reuse that conclusion broadly, rerun the same minimal slice on at least one other destination role before treating it as destination-agnostic.
15. After the output has been fully read and logged, delete only that dedicated test chat if cleanup is needed.
16. If another test slice will start immediately, do that deletion before creating the next dedicated test chat.
17. Only use project-wide chat deletion when the project is explicitly disposable or that destructive reset is clearly approved.
18. If you are resuming after compaction, handoff, or a long batch, verify that the previous dedicated test chat is no longer present before launching the next slice.

## Validation Checks

A run is only clean when all of these are true:

- Live `Instructions` contain the current repo-side bootstrap text.
- The uploaded zip is the freshly rebuilt one.
- The active test was run in a fresh dedicated chat rather than a reused conversation.
- The first test response references a concrete file from the uploaded context.
- The `Instructions` edit was a real replace-and-save, not an append attempt or a panel close without an active `Save` state.
- For intentionally thin or broken-context slices, one immediate follow-up verified actual source engagement before the slice was classified as project-grounded, even when the initial answer already named a file.

For early-turn multilingual repair work, add these extra checks before treating the intervention as real:

- The live `Instructions` text still contains the exact language-override lines after the settings panel is closed and reopened.
- The repaired prompt passes once on the original destination role and once on at least one second destination role.
- One bounded same-thread multilingual drift slice passes after the intervention instead of only a single first-turn prompt.

When a behavior claim depends on robustness across contexts, log the tested destination role, execution surface, and current-turn user language pattern so platform drift and language drift do not get collapsed together.

## Completion Signals

- During message execution, treat the switch from stop/square state back to the ordinary send arrow as the main completion signal.
- Scroll far enough to read the full tail of the answer before deciding whether the test passed.

## Contamination Signals

Stop and reclassify the result before changing role files when any of these appears:

- The browser surface is logged out, auth-gated, or otherwise not showing the real ChatGPT project UI.
- The intended project does not exist, or the available project is too contaminated or inappropriate for the test you need.
- The live `Instructions` text does not match the repo file you intended to use.
- The `Instructions` panel was closed without an active `Save`, meaning no real edit was registered.
- The zip upload lands in the message composer instead of `Sources`.
- The current slice was accidentally run in an older chat instead of a fresh dedicated one.
- The response talks about the zip generically but cannot name a concrete file it actually read.
- A thin prompt produces a plausible answer, but a direct follow-up reveals that no project file was read or that the model is asking the user to provide context it should have taken from `Sources`.
- A thin prompt names a concrete file or paraphrases project content, but a direct follow-up reveals that the reference was reconstructed from other signal rather than from actual readout in that thread.
- The surrounding project contains enough prior chats, mixed purposes, or unclear state that you can no longer bound how trustworthy continued interpretation is.

## Stop Conditions

Pause and reassess before continuing when:

- a new hidden control surface appears
- two consecutive local hypotheses fail
- reversibility drops materially
- the next live mutation could change the project in a way that is no longer easy to unwind
- the project has accumulated enough surrounding chat state that contamination risk is no longer easy to explain or bound

If that last condition appears:

- make the contamination risk explicit to the user before continuing
- prefer non-destructive mitigations first
- if clean testing still matters, recommend a separate empty project instead of escalating destructive cleanup in the current one

If the blocker is missing authentication:

- stop and ask the user to sign in before continuing
- do not treat the logged-out surface as evidence about the project, the role, or the workflow

## Minimal Log

Capture at least this after each live sync:

- which repo artifact changed
- whether `Instructions` were resynced
- whether `Sources` were refreshed
- which dedicated test chat was created for the slice
- whether that specific test chat was deleted after readout
- which probe was run first
- whether the result was clean, contaminated, or ambiguous
- whether surrounding project state raised contamination risk beyond the routine threshold
- whether any workflow finding crossed the threshold for immediate artifacting
- if yes, which smallest maintained artifact was updated before continuing
