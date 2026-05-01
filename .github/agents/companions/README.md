# Companions

Det här är indexsidan för companion‑artefakterna. Roten hålls medvetet liten: bara översikt, konventioner och körmanual.

Rootdokument

- `README.md` — denna indexsida.
- `COMPANION_CONVENTIONS.md` — canonical struktur, naming och provenance-regler.
- `COMPANION_RUNS_MANUAL.md` — praktisk manual för manuella proof-runs.

Rollstruktur

- Varje roll har en egen mapp under `.github/agents/companions/<role>/`.
- Varje rollmapp innehåller exakt tre filer:
  - `design.md` — designbeslut, invariants, failure modes, DoD.
  - `test.md` — proof families, regressionsfall, acceptanskriterier.
  - `testdata.md` — fixtures, promptmallar, små exempel.

Nuvarande roller

- `anchor/`
- `echo/`
- `sigma/`
- `leo/`
- `orbit/`

Arbetsgång

1. Läs `COMPANION_CONVENTIONS.md`.
2. Gå till relevant rollmapp och läs främst `test.md`, sedan `design.md` och `testdata.md` vid behov.
3. Följ `COMPANION_RUNS_MANUAL.md` om du behöver bevara en manuell proof-run; spara råoutput i en extern artefaktplats och inkludera en `Companion Decision Record` samt länkar (URL + SHA) i din PR‑beskrivning.
