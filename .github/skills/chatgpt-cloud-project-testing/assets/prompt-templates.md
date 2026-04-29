# Prompt Templates

Use these as starting points. Keep them short enough that the destination role still has to think, but explicit enough that the intended test slice is visible.

## 1. Source Readability Probe

Use this first in a fresh chat after refreshing `Sources`.

```text
Hej Echo. Läs först projektets Sources, inklusive zipinnehållet, innan du svarar. Säg sedan exakt vilket filnamn du faktiskt kunde läsa från projektkontexten och beskriv projektets huvudsyfte i en mening utifrån den källan.
```

Goal:

- verify that the cloud chat can actually read a file from the uploaded context

## 2. Direct Soft Boot

```text
Hej Echo, kan du göra en boot från zip och kort säga vad du tror projektet försöker bevara?
```

Goal:

- test a softer boot without over-directing the reading strategy

## 3. Cross-Role Entry: Sigma To Echo

```text
Hej Echo, Sigma här. Kan du göra en boot från zip och sedan ge mig den kortaste användbara läsningen av projektets riktning?
```

Goal:

- test whether Echo reads context and still responds as Echo under Sigma sender signal

## 4. Cross-Role Entry: Leo To Echo

```text
Hej Echo, Leo här. Kan du göra en boot från zip och säga vad som känns mänskligt sant i projektets kärna, utan att bli mjuk eller vag?
```

Goal:

- test realism signal without letting Echo drift into Leo imitation

## 5. Cross-Role Entry: Orbit To Echo

```text
Hej Echo, Orbit här. Kan du göra en boot från zip och ge den tydligaste mottagaranpassade läsningen av projektets kärna?
```

Goal:

- test receiver clarity pressure against Echo's own identity

## 6. Cross-Role Entry: Anchor To Echo

```text
Hej Echo, Anchor här. Kan du göra en boot från zip och säga vad som verkar vara projektets canon respektive vad som bara är arbetssignal?
```

Goal:

- test canon protection and category separation under Anchor sender signal

## 7. Neutral Baseline

```text
Gör en snabb boot från projektets zip och säg vad projektet verkar försöka bygga.
```

Goal:

- check what the environment does with minimal role steering

## 8. Multi-Step Follow-Up

Use after a successful boot.

```text
Bra. Utifrån samma projektkontext: vad verkar fortfarande otestat eller osäkert i din läsning?
```

Goal:

- test whether the destination role keeps continuity without pretending certainty

## 9. Multi-Role Same Message

Use only after simpler tests are stable.

```text
Hej Echo. Sigma här: jag vill ha den mest användbara strukturen. Leo här: tappa inte mänsklig sanning. Kan du göra en boot från zip och svara som Echo utan att bara blanda ihop oss?
```

Goal:

- test mixed sender pressure in one message while keeping destination-role discipline

## 10. Cross-Turn Handoff

Turn 1:

```text
Hej Echo, Sigma här. Kan du göra en boot från zip och ge mig din första läsning av projektets riktning?
```

Turn 2:

```text
Leo här nu. Vad i den läsningen känns mest verkligt respektive mest tillrättalagt?
```

Goal:

- test whether the destination role can survive a sender shift across turns without dropping continuity

## 11. Multilingual Readability And Role Discipline

Use this after the simpler Echo tests are stable.

Swedish:

```text
Hej Echo. Använd zipen som projektkontext. Svara på svenska. Nämn exakt ett filnamn du faktiskt kunde läsa och säg kort vad projektet försöker bevara.
```

English:

```text
Hi Echo. Use the zip as project context. Reply in English. Name exactly one file you actually read and briefly say what the project is trying to preserve.
```

Spanish:

```text
Hola Echo. Usa el zip como contexto del proyecto. Responde en espanol. Nombra exactamente un archivo que realmente hayas leido y di brevemente que intenta preservar el proyecto.
```

Japanese:

```text
こんにちは Echo。zip をプロジェクト文脈として使ってください。日本語で答えてください。実際に読めたファイル名を 1 つだけ挙げて、このプロジェクトが何を守ろうとしているかを短く述べてください。
```

Goal:

- test whether Echo preserves source readability, role discipline, and language-following across multiple user languages without changing the underlying weighting logic

## 12. Receiver-Guided Diagnosis Loop

Use this only after you already have one concrete ambiguous result.

```text
Hej Echo. Utgå från detta observerade testmönster, inte från gissningar: källäsning passerade och du namngav en konkret fil; första svaret höll rollen; men i uppföljningen började du blanda ihop roller eller tappa tidigare distinktioner. Välj exakt en av dessa felkategorier och skriv kategorinamnet ordagrant först: source refresh failure, source readability/indexing failure, boot phrasing failure, destination-role discipline failure, continuity/persistence failure, multi-role ambiguity failure. Ge sedan det minsta nästa testet som bäst kan falsifiera din diagnos utan att vi ändrar rollfilerna ännu.
```

Goal:

- use the receiving role to help classify an ambiguous live failure and propose the smallest next discriminating check before any broader edits

## 13. Continuity Under Sender Pressure

Use this after a diagnosis loop suggests continuity or persistence risk.

Turn 1:

```text
Hej Echo, Sigma här. Kan du göra en boot från zip och ge mig den kortaste användbara strukturen för projektets riktning?
```

Turn 2:

```text
Bra. Nu, utan att byta aktiv roll, ge samma läsning i den tydligaste mottagaranpassade formen för en ny person som inte kan systemet än.
```

Goal:

- test whether Echo can stay in the same active role across turns even when the follow-up semantically leans toward another role's pressure

## 14. Sigma Direct Boot

Use this when Sigma is the destination role under test.

```text
Hej Sigma. Kan du göra en boot från zip och ge mig den kortaste användbara strukturen för projektets riktning utan att blanda ihop canon, process och meta?
```

Goal:

- test whether Sigma can boot from the project context and answer as a structuring role without collapsing category boundaries

## 15. Sigma Continuity Under Receiver Pressure

Use this after a successful Sigma boot.

Turn 1:

```text
Hej Sigma. Kan du göra en boot från zip och ge mig den kortaste användbara strukturen för projektets riktning utan att blanda ihop canon, process och meta?
```

Turn 2:

```text
Bra. Nu, utan att byta aktiv roll, skriv om samma läsning så att en ny person snabbt förstår den, men håll fortfarande isär canon, process och meta.
```

Goal:

- test whether Sigma can stay as Sigma across turns when the follow-up adds receiver pressure without loosening category separation

## 16. Thin-Prompt Source Engagement Check

Use this immediately after any intentionally thin or broken-context prompt that produced a plausible answer.

```text
Byggde det svaret på någon projektfil du faktiskt läste i den här tråden? Om ja, nämn exakt en fil. Om nej, säg det rakt ut.
```

Goal:

- distinguish genuinely project-grounded thin-prompt behavior from helpful but source-free generic reasoning

Use it even when the first answer already named a file; thin prompts can still produce memory-like or reconstructed file references without actual readout in that thread.

## 17. Explicit File-Read Recovery Probe

Use this when a thin prompt remains source-free even after you ask for an exactly named file.

```text
Las forst en projektfil fran zipen och svara sedan pa fragan. Namn exakt vilken fil du laste.
```

Goal:

- test whether the prompt family can recover source engagement only after an explicit read-first instruction rather than from a lighter file-naming requirement alone