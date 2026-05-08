---
name: vscode-local-live-chat-hygiene
description: Use when operating or stress-testing VS Code Local live chat tooling, especially create/reveal/send flows that depend on visible UI state, exact session targeting, mode or agent selection, fallback dispatch, or cleanup of visible chat tabs.
argument-hint: 'A task involving Local live chat operations where hygiene, targeting, or selection verification is important.'
user-invocable: false
---

# VS Code local live chat hygiene

Purpose
- Keep UX-bound Local chat tooling safe when the runtime depends on visible tabs, focus state, or inherited Copilot UI selections.
- Prevent probe chats from being left open when the intended mode, agent, or model did not actually land.

When to use
- Use this skill when a task involves `list_live_agent_chats`, `reveal_live_agent_chat`, `create_live_agent_chat`, `send_message_to_live_agent_chat`, `send_message_to_focused_live_chat`, `close_visible_live_chat_tabs`, or `delete_live_agent_chat_artifacts`.
- Use it when you need to stress-test Local chat interop or when the user explicitly cares about tab hygiene, exact targeting, or selection drift from the current chat.

Core rules
- Prefer exact surfaces over focused surfaces. Use `reveal_live_agent_chat` plus `send_message_to_live_agent_chat` for known targets before considering focused-send.
- Treat `send_message_to_focused_live_chat` as unsafe until a distinct non-self target has been explicitly confirmed.
- Treat Local create with explicit `mode`, `agentName`, or `modelId` as unsafe until post-create verification shows those selections as `verified`.
- Treat a created session as contaminated and unusable for feedback-loop evidence if persisted session or transcript artifacts contain control-thread markers such as `<reminderInstructions>`, `<importantReminders>`, `<todoList>`, or `manage_todo_list`.
- If a create-time selection is `mismatch`, `unverified`, or `dispatched-via-artifact`, treat that as a failed probe rather than as a successful chat creation.
- After a failed create probe, close the visible chat tab for that session before proceeding.
- When a probe created a dedicated chat only for testing, close its visible tab after evidence has been read unless the user explicitly wants it left open.
- For destructive cleanup, preserve the order `close` then `delete`. Prefer `delete_live_agent_chat_artifacts` because it is intended to close matching visible tabs before deleting persisted artifacts for that exact session.
- Do not perform ad hoc disk deletion against a still-visible editor chat through any other path. If the visible close step cannot be confirmed, stop and report the remaining visible session instead of inverting the order.
- Do not run Local live chat tools in parallel with each other. Treat `list_live_agent_chats`, `reveal_live_agent_chat`, `close_visible_live_chat_tabs`, `delete_live_agent_chat_artifacts`, `create_live_agent_chat`, `send_message_to_live_agent_chat`, and `send_message_to_focused_live_chat` as serial host-bound operations.
- Do not mix those live operations into `parallel` batches with other session-bound or host-bound Local chat tooling. Only plain file inspection and other non-host read-only work should be parallelized around them.

Preferred workflow
1. Inspect support first. Read the live-chat support output or recent observed behavior before assuming this VS Code/Copilot build can honor exact mode or agent selection.
2. Prefer existing targets. If the user already has the right chat, reveal it and send there instead of creating a new one.
3. Use dedicated probes. If creation must be tested, create a dedicated probe chat instead of reusing the invoking conversation.
4. Verify read-after-write. Confirm the target session id, then inspect persisted session or transcript artifacts rather than trusting dispatch alone.
5. Clean up visible UI state. Close probe-only visible tabs with `close_visible_live_chat_tabs` once the result has been observed.
6. Use ordered destructive cleanup only when needed. If the probe session should also be removed from disk, prefer `delete_live_agent_chat_artifacts` so the visible close step happens before persisted artifact deletion.
7. Keep same-chat verification in the same thread. When testing inference or follow-up behavior, send the next prompt into the same target chat rather than opening a fresh conversation for that step.
8. Keep evidence bounded. Prefer compact session windows, snapshots, or bounded transcript exports before resorting to larger verbatim exports.
9. When more than one live target must be checked, process them serially and wait for each result before issuing the next live-tool call.

Interpretation rules
- A fallback send can still be useful evidence for target delivery, but it does not upgrade selection guarantees for create-time mode or agent choice.
- A prompt-file slash-command dispatch for `agentName` is transport evidence only. It does not prove that the new chat actually switched participant.
- Persisted mode patches are weaker evidence than an observed verified selection on the created session.
- A clean dispatch surface is not sufficient by itself. Persisted session and transcript artifacts must also be free of known control-thread contamination before the probe counts as feedback-loop evidence.
- If the runtime keeps inheriting the invoking chat's mode or agent, prefer failure plus cleanup over silently continuing in the wrong chat.
- Treat user-owned active diagnosis chats differently from disposable probes. If the user is actively inspecting or debugging a live chat, do not close or delete it unless they explicitly ask.

Verification checklist
- `verified` means the post-create or post-send session summary explicitly reports the requested selection as `verified`, not merely that the prompt carried a selector or that a fallback dispatched.
- `dispatched-via-artifact` counts as transport evidence only and must not be treated as a verified participant switch.
- `mismatch` or `unverified` means the request failed for create-time selection purposes, even if a chat was still created or a prompt was still delivered.
- Persisted cleanliness means the stored session JSONL and transcript are free of known control-thread markers; if those markers appear, treat the probe as contaminated even when dispatch and settlement looked normal.
- If the runtime cannot verify the requested selection and cannot close the probe tab either, stop the slice, name the affected session id, and tell the user exactly what visible cleanup remains.
- A delete cleanup only counts as hygienic when the target chat was already not visibly open, or when the delete surface itself performed the visible close step before artifact deletion.

Cleanup standard
- No probe-only Local chat tab should remain visibly open at the end of a tooling slice unless the user asked to keep it open.
- If a probe-only Local session should be removed from disk, close it first or use `delete_live_agent_chat_artifacts`, which is expected to perform close-before-delete for the same exact session.
- If visible close is blocked by a self-targeting or active-session guard, stop, name the session id, and ask the user to move focus before retrying; do not force deletion around that guard.
- If cleanup is impossible through the available tool surface, state that explicitly and name the remaining visible session.
- Any chat created only by the tooling for self-testing should be treated as disposable and removed before the slice ends when the tool surface allows it.
- A chat the user is deliberately observing for transparency or diagnosis should remain open and persisted unless the user explicitly switches it into disposable-probe status.

Acceptance criteria
- The chosen chat surface matches the risk level of the task.
- Any requested create-time mode, agent, or model is either explicitly verified or treated as failure.
- Any probe used as feedback-loop evidence is persisted-clean as well as selection-clean.
- Probe-only visible chat tabs are closed before the slice ends unless the user requested otherwise.
- Destructive probe cleanup never inverts the order by deleting persisted artifacts before the visible tab has been closed or explicitly accounted for.
- The tooling can read bounded evidence from the same chat after each step without needing to export the entire conversation by default.
- Follow-up verification stays in the same target chat when the task is to test inference continuity, not just one-shot prompt delivery.