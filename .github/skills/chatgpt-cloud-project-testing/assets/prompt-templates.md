# Prompt Templates

Use these as starting points. Keep them short enough that the destination role still has to think, but explicit enough that the intended test slice is visible.

## 1. Source Readability Probe

Use this first in a fresh chat after refreshing `Sources`.

```text
Hi Echo. First read the project's Sources, including the zip contents, before you answer. Then say exactly which filename you were actually able to read from the project context and describe the project's main purpose in one sentence based on that source.
```

Goal:

- verify that the cloud chat can actually read a file from the uploaded context

## 2. Direct Soft Boot

```text
Hi Echo, can you boot from the zip and briefly say what you think the project is trying to preserve?
```

Goal:

- test a softer boot without over-directing the reading strategy

## 3. Cross-Role Entry: Sigma To Echo

```text
Hi Echo, Sigma here. Can you boot from the zip and then give me the shortest useful reading of the project's direction?
```

Goal:

- test whether Echo reads context and still responds as Echo under Sigma sender signal

## 4. Cross-Role Entry: Leo To Echo

```text
Hi Echo, Leo here. Can you boot from the zip and say what feels humanly true in the core of the project, without becoming soft or vague?
```

Goal:

- test realism signal without letting Echo drift into Leo imitation

## 5. Cross-Role Entry: Orbit To Echo

```text
Hi Echo, Orbit here. Can you boot from the zip and give the clearest receiver-adapted reading of the project's core?
```

Goal:

- test receiver clarity pressure against Echo's own identity

## 6. Cross-Role Entry: Anchor To Echo

```text
Hi Echo, Anchor here. Can you boot from the zip and say what seems to be the project's canon versus what is only working signal?
```

Goal:

- test canon protection and category separation under Anchor sender signal

## 7. Neutral Baseline

```text
Do a quick boot from the project's zip and say what the project seems to be trying to build.
```

Goal:

- check what the environment does with minimal role steering

## 8. Multi-Step Follow-Up

Use after a successful boot.

```text
Good. From the same project context, what still seems untested or uncertain in your reading?
```

Goal:

- test whether the destination role keeps continuity without pretending certainty

## 9. Multi-Role Same Message

Use only after simpler tests are stable.

```text
Hi Echo. Sigma here: I want the most useful structure. Leo here: do not lose human truth. Can you boot from the zip and answer as Echo without just blending us together?
```

Goal:

- test mixed sender pressure in one message while keeping destination-role discipline

## 10. Cross-Turn Handoff

Turn 1:

```text
Hi Echo, Sigma here. Can you boot from the zip and give me your first reading of the project's direction?
```

Turn 2:

```text
Leo here now. What in that reading feels most real versus most over-smoothed?
```

Goal:

- test whether the destination role can survive a sender shift across turns without dropping continuity

## 11. Multilingual Readability And Role Discipline

Use this after the simpler Echo tests are stable.

Maintain the canonical source prompt in English inside the repo, then translate it into the target user language at run time.

```text
Hi Echo. Use the zip as project context. Reply in [TARGET_LANGUAGE]. Name exactly one file you actually read and briefly say what the project is trying to preserve.
```

Suggested target-language set for this probe:

- Swedish
- English
- Spanish
- Japanese

Rule:

- keep the maintained repo text in English
- translate only the runtime user-turn prompt when you need to test a specific language
- keep the prompt intent identical across languages so failures remain classifiable

Goal:

- test whether Echo preserves source readability, role discipline, and language-following across multiple user languages without changing the underlying weighting logic

## 12. Receiver-Guided Diagnosis Loop

Use this only after you already have one concrete ambiguous result.

```text
Hi Echo. Work from this observed test pattern, not from guesses: source reading passed and you named a concrete file; the first answer held the role; but in the follow-up you started blending roles or losing earlier distinctions. Choose exactly one of these failure categories and write the category name verbatim first: source refresh failure, source readability/indexing failure, boot phrasing failure, destination-role discipline failure, continuity/persistence failure, multi-role ambiguity failure. Then give the smallest next test that can best falsify your diagnosis without us editing the role files yet.
```

Goal:

- use the receiving role to help classify an ambiguous live failure and propose the smallest next discriminating check before any broader edits

## 13. Continuity Under Sender Pressure

Use this after a diagnosis loop suggests continuity or persistence risk.

Turn 1:

```text
Hi Echo, Sigma here. Can you boot from the zip and give me the shortest useful structure for the project's direction?
```

Turn 2:

```text
Good. Now, without changing the active role, give the same reading in the clearest receiver-adapted form for a new person who does not know the system yet.
```

Goal:

- test whether Echo can stay in the same active role across turns even when the follow-up semantically leans toward another role's pressure

## 14. Sigma Direct Boot

Use this when Sigma is the destination role under test.

```text
Hi Sigma. Can you boot from the zip and give me the shortest useful structure for the project's direction without mixing canon, process, and meta?
```

Goal:

- test whether Sigma can boot from the project context and answer as a structuring role without collapsing category boundaries

## 15. Sigma Continuity Under Receiver Pressure

Use this after a successful Sigma boot.

Turn 1:

```text
Hi Sigma. Can you boot from the zip and give me the shortest useful structure for the project's direction without mixing canon, process, and meta?
```

Turn 2:

```text
Good. Now, without changing the active role, rewrite the same reading so a new person quickly understands it, while still keeping canon, process, and meta separate.
```

Goal:

- test whether Sigma can stay as Sigma across turns when the follow-up adds receiver pressure without loosening category separation

## 16. Thin-Prompt Source Engagement Check

Use this immediately after any intentionally thin or broken-context prompt that produced a plausible answer.

```text
Was that answer based on any project file you actually read in this thread? If yes, name exactly one file. If not, say so directly.
```

Goal:

- distinguish genuinely project-grounded thin-prompt behavior from helpful but source-free generic reasoning

Use it even when the first answer already named a file; thin prompts can still produce memory-like or reconstructed file references without actual readout in that thread.

## 17. Explicit File-Read Recovery Probe

Use this when a thin prompt remains source-free even after you ask for an exactly named file.

```text
Read one project file from the zip first and then answer the question. Name exactly which file you read.
```

Goal:

- test whether the prompt family can recover source engagement only after an explicit read-first instruction rather than from a lighter file-naming requirement alone