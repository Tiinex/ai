# Companion Conventions — canonical companion structure

Purpose
- Fast specification of the repo conventions for companion files and run artifacts.

Canonical structure
- Companion triad per role, grouped by folder: `.github/agents/companions/<role>/design.md`, `test.md`, `testdata.md`.
- Keep companions purely declarative: no raw model outputs, no timestamps for runs, no runtime diffs.

Roles of each companion
- `design`: all design decisions, invariants, negative constraints, failure modes and accept criteria.
- `test`: epistemic test descriptions: proof families, expected behaviours, regression families, and acceptance criteria. Do NOT include execution provenance (dates/SHAs) here.
- `testdata`: fixtures, prompt templates, and small sample inputs required to exercise tests.

Provenance and run artifacts
- Preferred storage: do NOT commit run files to the `main` branch. Store execution provenance and large/raw outputs in an external artifact store (CI artifacts, S3, Gist, a private bucket, or a dedicated artifact repo).
- When a role companion defines explicit judgment states in its `test.md`, use those exact labels in run summaries and PR descriptions instead of collapsing the outcome into a generic PASS/FAIL label.

- PR practice: include a concise `Companion Decision Record` and a short run summary in the PR description, together with stable links (URL + SHA) to external artifacts. This preserves auditability without adding dated files to `main`.
- Keep narrow slice judgments separate from broader readiness claims. A clean slice pass should not be described as promotion readiness unless the role companion explicitly defines that higher state and its evidence requirements.

- Archival option: if you must persist summaries in version control, place them in an archival branch (e.g. `runs-archive/`) or a separate repo. Minimal summary fields: `run-id`, `date`, `commit`, `companion-version` (path@SHA), `surface`, `target`, `outcome`, and `evidence-links` (external URLs + SHAs). Keep such files intentionally tiny.

- Rationale: keeping raw outputs and diffs outside the main repo keeps the codebase clean and avoids date‑driven clutter while still enabling reviewers to verify evidence via stable external links.

Naming & placement
- Shared docs live at `.github/agents/companions/README.md`, `COMPANION_CONVENTIONS.md`, and `COMPANION_RUNS_MANUAL.md`.
- Role-specific companion files live under `.github/agents/companions/<role>/`.
- Companion ownership is role-scoped. Do not create separate companion triads just because a role has model-bound, `experimental`, `candidate`, or `any` agent-file variants; create a new triad only when there is a genuinely new role.
- Agent-file lifecycle and naming rules belong to `ROLE_DEVELOPMENT_LOOP.md`. In short: keep display names human-readable with parenthetical model and lifecycle disambiguation, and keep filenames split-safe with slug tokens such as `gpt-4-1`, `gpt-5-4-mini`, `any`, `experimental`, and `candidate`.
- Run artifacts should be stored externally and linked from PRs. The local `runs/companion-runs/` folder may contain examples, templates or archived summaries only; it is not the recommended place for live evidence commits to `main`.

Retention & large outputs
- Prefer referencing external artifact storage for large raw outputs (CI artifacts, S3, gist) and include the stable link + SHA in the run file.

CI and automation policy
- CI may implement warn-only structural checks that validate presence and minimal frontmatter for companions and run artifacts, but MUST NOT execute or score agents automatically.

Migration guidance (skill-only → companion triad)
- If you currently store design/test/testdata in a single `SKILL.md`, split into the triad: move design sections → `<role>/design.md`, tests → `<role>/test.md`, fixtures → `<role>/testdata.md`.
- Keep `SKILL.md` as an aggregator/instructional document linking to companions and describing manual run flow, not as canonical test specs.

Conventions enforcement
- Do not add dates or commit SHAs into companion `<role>/test.md` files; provenance belongs in runs.
- Companion content is intended to be time‑independent; use run artifacts to capture time‑dependent evidence.
