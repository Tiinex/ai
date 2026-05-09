# Companions

This is the index page for the companion artifacts. The root is kept intentionally small: overview, conventions, and run manual only.

Root documents

- `README.md` — this index page.
- `COMPANION_CONVENTIONS.md` — canonical structure, naming, and provenance rules.
- `COMPANION_RUNS_MANUAL.md` — practical manual for manual proof runs.

Role structure

- Each role has its own folder under `.github/agents/companions/<role>/`.
- Each role folder contains exactly three files:
  - `design.md` — design decisions, invariants, failure modes, DoD.
  - `test.md` — proof families, regression cases, acceptance criteria.
  - `testdata.md` — fixtures, prompt templates, small examples.
- Companion ownership is keyed by role, not by model or lifecycle variant. Model-bound, `experimental`, `candidate`, or `any` agent-file variants for the same role should normally read against the same companion triad unless a genuinely new role is being created.

Current roles

- `anchor/`
- `echo/`
- `kodax/`
- `sigma/`
- `leo/`
- `myable/`
- `orbit/`

Workflow

1. Read `COMPANION_CONVENTIONS.md`.
2. Go to the relevant role folder and read `test.md` first, then `design.md` and `testdata.md` as needed.
3. If the role's `test.md` defines explicit judgment states, use those exact labels when you classify the run outcome.
4. Follow `COMPANION_RUNS_MANUAL.md` if you need to preserve a manual proof run; store raw output in an external artifact location and include a `Companion Decision Record` plus links (URL + SHA) in your PR description.
5. If you are creating or renaming agent files, use `ROLE_DEVELOPMENT_LOOP.md` as the source of truth for candidate versus experimental lifecycle handling and for display-name versus filename conventions.
