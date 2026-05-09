---
name: vscode-local-live-chat-hygiene
description: Use when auditing or reconciling AI-repo hygiene guidance for VS Code Local live chat tooling, especially when older repo-side guidance may conflict with the newer ai-vscode-tools workflow skills.
argument-hint: 'A repo-side Local chat guidance audit, for example: stale hygiene skill, cross-repo skill conflict, or workflow-surface reconciliation.'
user-invocable: false
---

# VS Code local live chat hygiene

Scope boundary
- This skill exists only to prevent stale AI-repo guidance from competing with the maintained Local chat workflow skills.
- It is not the primary operational source for direct Local chat tool use.
- When ai-vscode-tools is present in the workspace, use its narrower skills as the maintained operational sources:
	- local-chat-create-send-workflows for create and send behavior
	- local-chat-delete-workflows for exact delete behavior
	- persisted-session-inspection for bounded stored-session inspection

When to use
- Use this skill when auditing whether older AI-repo instructions, transition notes, or convenience artifacts still match the tooling repo.
- Use it when a conversation appears to have loaded stale Local chat guidance and you need to classify the drift before continuing.
- Do not use this skill as the main procedural guide for direct create, send, delete, or stored-session inspection work.

Core rules
- One workflow should have one primary skill surface.
- If a narrower maintained tooling-repo skill exists for the task, that skill outranks this one.
- If this skill is loaded during direct Local chat operations, treat that as a routing smell and hand the operational flow back to the tooling-repo skill before acting.
- If repo-side guidance and tooling-repo guidance disagree, treat that as setup drift first, not as role failure.

Audit procedure
1. Identify the Local chat task class: create/send, exact delete, or persisted-session inspection.
2. Identify which skill should be primary for that class in ai-vscode-tools.
3. Check whether an AI-repo instruction, transition artifact, or older skill is still describing the same workflow in a competing way.
4. Keep only the minimum shared safety language needed in the AI repo; move or defer operational procedure to the tooling-repo skill.
5. If the conflict appears to have affected an active conversation, treat the session as potentially contaminated by stale guidance until a fresh load or clean reroute confirms otherwise.

Acceptance criteria
- The AI repo no longer presents itself as the primary operational source for direct Local chat workflows when ai-vscode-tools is available.
- Each Local chat workflow class has one clear maintained primary skill surface.
- Repo-side guidance can still explain drift or audit conflicts without reintroducing a second operational canon.