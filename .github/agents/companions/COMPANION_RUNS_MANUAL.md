# Companion-run manual

Purpose
- Provide a practical, human-driven workflow for running, validating, and preserving evidence for companion proofs without making tests operational or automatic.

When to run a proof run
- When you change a role/agent definition (`*.agent.md`) or a runtime artifact (for example files under `docs/targets/`) and need to preserve read-after-write evidence.

Preparation
1. Start from a clean working tree: no unintended edits, no open probe files.
2. Read the relevant companion files under `.github/agents/companions/<role>/` (`design.md`, `test.md`, `testdata.md`).
3. Decide the intended surface (for example Local VS Code chat, Hosted preview) where you will run the prompt.

Steps for a manual proof run (clean main-branch practice)

1) Re-ground
- Note which files you read and their git revision (for example `git rev-parse HEAD`). Record this in your local run note.

2) Run the prompt manually and collect raw output
- Run it manually in Local chat or another intended surface.
- Save raw output and any diffs locally or in a temporary working directory, but avoid committing these files to `main`.

3) Upload evidence to an external artifact location
- Upload large raw outputs and diffs to an external artifact store (for example CI artifacts, S3, gist, or a dedicated artifact repo). Record the URL and artifact SHA/id.

4) Companion Decision Record in the PR description
- Insert a short `Companion Decision Record` and a short `Run Summary` in the PR description. Include `commit` (SHA), `companion_version` (path@SHA), and `evidence_links` (URL + SHA) to external artifacts.

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
- probe-intent: "<short description of what was tested>"
- outcome: PASS | FAIL | INCONCLUSIVE
- short-validation: "<one-line read-after-write summary>"
```

5) Cleanup
- Remove or revert temporary probe-only artifacts locally. Confirm in the PR description that cleanup was done.

6) Optional archival branch
- If you need to commit run summaries for organizational reasons, place them in a separate archive branch (for example `runs-archive/`) or in a separate repo. Keep the files minimal and free of large raw outputs.

Reviewer checklist
- Read the companion design and `test.md`.
- Verify that the PR description contains a `Companion Decision Record` and that `evidence_links` point to accessible artifacts.
- Check that diffs/outputs in the external artifacts demonstrate the read-after-write effect.

Tips
- Keep PR summaries short but verifiable. Link artifacts with SHA for durability.

See also
- Run policy: `.github/agents/companions/COMPANION_CONVENTIONS.md`
- Companion guide: `.github/agents/companions/README.md`
