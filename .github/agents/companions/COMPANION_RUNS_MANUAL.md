# Companion‑run manual

Syfte
- Ge en praktisk, mänsklig‑driven arbetsgång för att köra, validera och bevara bevis för companion‑proofs utan att göra tester operativa eller automatiska.

När ska du köra en proof‑run
- När du ändrar en roll/agentdefinition (`*.agent.md`) eller ett runtime‑artifact (t.ex. filer under `docs/targets/`) och behöver bevara read‑after‑write‑evidens.

Förberedelser
1. Starta från en ren arbetskatalog: inga oavsiktliga redigeringar, inga öppna probe‑filer.
2. Läs igenom relevanta companion‑filer under `.github/agents/companions/<role>/` (`design.md`, `test.md`, `testdata.md`).
3. Bestäm den avsedda ytan (t.ex. Local VS Code chat, Hosted preview) där du kommer köra prompten.

Steg för en manual proof‑run (ren main‑gren praxis)

1) Re‑ground
- Anteckna vilka filer du läste och deras git‑revision (t.ex. `git rev-parse HEAD`). Notera detta i din lokala run‑anteckning.

2) Kör prompten manuellt och samla råoutput
- Kör manuellt i Local chat eller annan avsedd yta.
- Spara råoutput och eventuella diffs lokalt eller i en temporär arbetskatalog — MEN undvik att committa dessa filer till `main`.

3) Ladda upp bevis till en extern artefaktplats
- Ladda upp stora raw‑outputs och diffs till ett externt artefaktlager (t.ex. CI artifacts, S3, gist, eller en dedikerad artefakt‑repo). Notera URL och artefakt‑SHA/id.

4) Companion Decision Record i PR‑beskrivningen
- Infoga en kort `Companion Decision Record` och en kort `Run Summary` i PR‑beskrivningen. Inkludera `commit` (SHA), `companion_version` (path@SHA), och `evidence_links` (URL + SHA) till externa artefakter.

Exempel (PR‑beskrivning):
```
## Companion Decision Record
- companion_decision: parent-proof-sufficient
- companion_target_role: <RoleName>
- companion_exception_gap: -
- companion_exception_reason: -
- commit: <git-sha>
- companion_version: .github/agents/companions/<role>/test.md@<sha>
- evidence_links:
  - https://artifact.example.com/path/to/output.tar.gz#sha=<sha>

## Run Summary
- probe-intent: "<kort beskrivning av vad som testades>"
- outcome: PASS | FAIL | INCONCLUSIVE
- short-validation: "<enradig read-after-write‑summering>"
```

5) Cleanup
- Ta bort eller revert:a temporära probe‑only artifacts lokalt. Bekräfta i PR‑beskrivningen att cleanup gjorts.

6) Optional archival branch
- Om ni av organisatoriska skäl behöver committa run‑summaries, placera dem i en separat arkiv‑branch (t.ex. `runs-archive/`) eller i ett separat repo. Håll filerna minimala och utan stora råoutputs.

Reviewer‑checklista
- Läs companion‑design och `test.md`.
- Verifiera att PR‑beskrivningen innehåller en `Companion Decision Record` och att `evidence_links` pekar på tillgängliga artefakter.
- Kontrollera att diffs/outputs i externa artefakter demonstrerar read‑after‑write‑effekten.

Tips
- Håll PR‑sammandrag kort men verifierbart. Länka artefakter med SHA för beständighet.

Se även
- Run‑policy: `.github/agents/companions/COMPANION_CONVENTIONS.md`
- Companion‑guide: `.github/agents/companions/README.md`
