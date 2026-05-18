# Traceable Subagent Runtime Plan

This file is a transitional planning surface for a Tiinex-owned subagent runtime.

Use it to define a narrow first implementation plan for a subagent lane that preserves enough trace and structure for the parent agent to falsify skipped work, hidden closure, and fabricated completion.

Do not treat this file as canon, as a shipping implementation spec, or as permission to build a broad autonomous framework before the narrow proof passes.

## Why This Plan Exists

- The current upstream subagent path appears to hide too much of its effective orchestration from the parent surface.
- That makes it too easy for the parent agent to receive a polished child answer without enough trace to determine whether the child actually performed the expected work.
- For Tiinex, that is not only a quality problem. It is a falsifiability problem.

## Core Requirement

- A Tiinex-owned subagent lane must return enough structured execution trace to the parent agent that the parent can falsify whether expected steps happened.
- The parent does not need every tool payload in full.
- The parent does need a trustworthy record of what the child attempted, what it skipped, what tool calls occurred, what tool calls were expected but never happened, and why the child claims it stopped.

## Input Separation Requirement

- The request contract must keep `userInput` separate from `parentTask`.
- The request contract should also keep parent-side expectations separate from carried context and from runtime wrapper policy.
- The child should be able to see the original user wording without forcing the parent to bundle it into one merged delegation blob.

Why it matters:
- If raw user intent, parent interpretation, and runtime steering are merged into one field, it becomes harder to detect whether the child answered the original need, the parent's reformulation, or hidden runtime pressure.

## Non-Goal Boundary

- The goal is not to mirror every token or every raw tool payload back to the parent.
- The goal is not to eliminate bounds or guardrails entirely.
- The goal is not to make the child incapable of summarizing.
- The goal is to make summarization subordinate to traceable evidence rather than a replacement for it.

## Parent-Falsification Contract

The parent should receive a structured subagent result with at least these fields.

### 1. Invocation Contract

- `userInput`: the original or near-original user wording when available
- `parentTask`: the exact task the parent asked the child to perform
- `parentExpectations`: the expected steps, evidence, or tool families the parent wants before trusting a strong conclusion
- `carriedContext`: the explicit context slice provided to the child
- `wrapperPolicy`: the explicit Tiinex wrapper or mode used for the child run
- `budgetPolicy`: the iteration, token, and tool bounds applied to the run

Why it matters:
- The parent must know what the child was actually asked to do, what the user originally asked for, and what runtime framing was added around the run.

### 1a. Wrapper Policy Boundary

- `wrapperPolicy` should describe only the explicit runtime framing for the child lane.
- It should remain infrastructural rather than cognitive.
- It may describe lane name, closure mode, output contract, or bounded tool policy.
- It should not silently add operational style, deliverable pressure, or closure pressure that changes the agent's epistemic posture unless that change is explicit in the request.

Why it matters:
- The goal is not to have zero wrapper.
- The goal is to avoid hidden or behavior-distorting wrapper logic that the parent cannot inspect.

### 2. Step Trace

- `steps`: an ordered list of child decisions or execution phases
- each step should include a short `intent`, a `status`, and a timestamp or monotonic order marker
- statuses should distinguish at least `planned`, `attempted`, `completed`, `failed`, and `skipped`

Why it matters:
- The parent needs to see whether a later claim depended on a step that was never actually attempted.

### 3. Tool Trace

- `toolCalls`: an ordered list of tool invocations with tool name, compact arguments summary, and result classification
- tool result classification should distinguish at least `success`, `failure`, `timeout`, `inputNeeded`, and `notRun`
- full payload bodies should be optional and bounded

Why it matters:
- The parent does not need full logs by default, but it does need a trustworthy ledger of which tools were actually called.

### 4. Expected-But-Missing Trace

- `expectedButMissing`: a list of expected steps or expected tool calls that never occurred
- the child may populate this directly when it knows it stopped before a planned step
- the parent may also derive this by comparing plan intent against actual tool trace

Why it matters:
- This is the minimum contract needed to detect skipped work behind a polished child summary.

### 5. Stop Reason

- `stopReason`: one explicit stop class such as `completed`, `budget_exhausted`, `insufficient_grounding`, `tool_blocked`, `awaiting_input`, or `policy_stop`
- `completionClaim`: whether the child claims the task is actually complete, partially complete, or unresolved

Why it matters:
- The parent should never have to infer from tone whether the child stopped because it finished or because it ran out of room.

### 6. Final Summary

- `finalSummary`: a bounded natural-language summary for parent consumption
- this summary must be downstream of the trace, not a substitute for it

Why it matters:
- The parent still needs an efficient answer surface, but it must be tethered to traceable execution.

## Minimum Result Shape For V1

The first prototype only needs a compact result shape.

```ts
type TraceableSubagentRequest = {
  userInput: string;
  parentTask: string;
  parentExpectations?: {
    expectedSteps?: string[];
    expectedToolFamilies?: string[];
    disallowStrongConclusionWithoutEvidence?: boolean;
  };
  carriedContext?: {
    priorTurnsSummary?: string;
    fileContext?: string[];
    reductions?: string[];
  };
  wrapperPolicy?: {
    name: string;
    closureMode: "open" | "bounded-summary" | "explicit-final";
  };
  budgetPolicy?: {
    maxIterations: number;
    maxToolCalls?: number;
  };
};

type TraceableSubagentResult = {
  userInput: string;
  parentTask: string;
  parentExpectations?: {
    expectedSteps?: string[];
    expectedToolFamilies?: string[];
    disallowStrongConclusionWithoutEvidence?: boolean;
  };
  carriedContext: {
    priorTurnsSummary?: string;
    fileContext?: string[];
    reductions?: string[];
  };
  wrapperPolicy: {
    name: string;
    closureMode: "open" | "bounded-summary" | "explicit-final";
  };
  budgetPolicy: {
    maxIterations: number;
    maxToolCalls?: number;
  };
  steps: Array<{
    id: string;
    intent: string;
    status: "planned" | "attempted" | "completed" | "failed" | "skipped";
    note?: string;
  }>;
  toolCalls: Array<{
    stepId?: string;
    toolName: string;
    argsSummary: string;
    result: "success" | "failure" | "timeout" | "inputNeeded" | "notRun";
  }>;
  expectedButMissing: Array<{
    kind: "step" | "toolCall";
    label: string;
    reason: string;
  }>;
  stopReason:
    | "completed"
    | "budget_exhausted"
    | "insufficient_grounding"
    | "tool_blocked"
    | "awaiting_input"
    | "policy_stop";
  completionClaim: "complete" | "partial" | "unresolved";
  finalSummary: string;
};
```

## V1 Behavioral Rules

### Rule 1. Trace Before Polish

- The child may emit a compact summary, but only after the trace object is available.
- If there is a conflict between a clean summary and an incomplete trace, trace wins.

### Rule 2. No Silent Step Elision

- If a step was planned and then skipped, the result must say so explicitly.
- The child must not silently compress `planned -> never attempted` into a clean completion tone.

### Rule 3. No Implicit Completion Upgrade

- If the child stops because of budget, missing context, or tool blockage, `completionClaim` must not be `complete`.

### Rule 4. Parent May Reject The Child Result

- The parent should be allowed to reject the child result as insufficient if expected trace is missing or if the stop reason conflicts with the summary.
- A child result that cannot survive parent falsification should not be treated as usable evidence.

### Rule 5. Epistemic Wrapper Safety

- A runtime wrapper may enforce trace and budget contracts.
- A runtime wrapper must not silently convert an epistemic child into a deliverable-first child.
- If a lane intentionally changes posture, that change should be explicit in request policy rather than buried in hidden runtime text.

## Delegation Policy

### Tiinex Runtime Re-entry

- The traceable Tiinex subagent runtime should be `non-reentrant`.
- A child run may not invoke the same traceable Tiinex subagent runtime again from inside itself.
- If it tries, the runtime should surface an explicit policy error rather than silently branching into a child tree.

Why it matters:
- This prevents accidental tree expansion, budget leakage, and ambiguous responsibility chains.

### Native `runSubagent` Delegation

- Native `runSubagent` may remain allowed inside the Tiinex child lane.
- But it should be classified as `opaque delegation` rather than as fully trace-supported work.
- If a strong child conclusion depends materially on such opaque delegation, the parent's trust classification should be downgraded accordingly.

Why it matters:
- This preserves practical flexibility without pretending that native delegated work is as falsifiable as locally observed trace.

## First Narrow Use Case

Use one small task family only for v1.

- search-oriented bounded code investigation
- or execution-oriented bounded command investigation

Do not start with a general-purpose child that can do everything.

The best first slice is the one where missing expected tool calls are easiest to falsify.

Example:
- parent asks child to inspect a code path and identify the controlling implementation
- expected trace usually includes search or read steps before any strong conclusion
- if the child returns a strong conclusion without those steps, the parent can reject it

Current preference:
- prefer a search-oriented first slice over an execution-oriented first slice, because it is usually easier to falsify claims such as "the child never actually read the controlling code it is summarizing"

## MRFC Integration

The traceable runtime plan should be validated against the existing upstream-runtime evaluation.

The minimum comparison set is:

- direct chat or same-session live chat
- upstream subagent path
- Tiinex traceable subagent prototype

The comparison should hold stable:

- task
- model
- repo context
- initial human wording

The parent should specifically check:

- whether expected steps appear in trace
- whether any tool calls were skipped silently
- whether stop reason matches completion claim
- whether final summary overstates what the trace actually supports

## Implementation Sequence

### Phase 1. Planning Artifact

- Freeze the result contract and parent-falsification rules in repo-visible markdown.
- Keep the scope narrow enough that one missing trace field still has a clear meaning.

### Phase 2. Minimal Prototype

- Add one internal Tiinex tool surface that invokes a bounded child lane and returns the compact trace object plus final summary.
- Keep it explicitly experimental and non-canonical.
- Do not block this phase on full native-like UX parity with upstream `runSubagent`.

### Phase 3. Parent Evaluation Logic

- Add parent-side checks that classify child output as `trace-supported`, `trace-incomplete`, or `trace-conflicted`.
- Do not let the parent consume `trace-conflicted` as if it were normal success.

### Phase 4. MRFC Proof

- Run the same slice across direct, upstream, and Tiinex-owned lanes.
- Record where upstream hides or compresses steps that the Tiinex lane surfaces explicitly.

### Phase 5. Operator UX Exploration

- After the first traceable lane works, explore whether the host can present the run as a compact collapsible chat row with progressive disclosure similar to native `runSubagent`.
- Treat exact native-parity live expansion as a non-critical-path investigation, not as a prerequisite for the core runtime contract.

## Main Risks And Mitigations

### Risk 1. The First Version Becomes A Generic Agent Framework

Failure mode:
- The implementation grows sideways into a broad child-agent platform before the narrow proof has passed.

Mitigation:
- Keep v1 limited to one task family and one trace result shape.
- Reject new feature work that does not improve parent falsifiability directly.
- Treat every new capability as out of scope unless it is required for the current MRFC slice.

### Risk 2. Trace Looks Rich But Is Not Trustworthy

Failure mode:
- The child returns a convincing trace object that is still partially self-reported and therefore can drift away from actual tool execution.

Mitigation:
- Prefer parent-owned or runtime-owned event capture for tool invocation ledger fields wherever possible.
- Distinguish `child-reported` from `runtime-observed` fields when both exist.
- Do not let a purely self-reported trace count as the full proof surface if runtime observation is available.

### Risk 3. Parent Consumes Summary As Truth Again

Failure mode:
- The trace object exists, but parent logic informally trusts `finalSummary` anyway.

Mitigation:
- Require parent classification before result consumption: `trace-supported`, `trace-incomplete`, or `trace-conflicted`.
- Block normal success handling for `trace-conflicted` results.
- Make `completionClaim` subordinate to trace and stop reason, not to wording quality.

### Risk 4. The Child Silently Skips Expected Work

Failure mode:
- The child plans a search, read, or execution step but exits before attempting it and still sounds complete.

Mitigation:
- Preserve explicit `planned` and `skipped` statuses.
- Preserve `expectedButMissing` as a first-class field.
- Teach the parent to reject strong conclusions when expected supporting steps are absent.

### Risk 5. Scope Creep Hides Causality

Failure mode:
- Too many features land in the same iteration, making it impossible to tell which design change actually improved or worsened behavior.

Mitigation:
- Limit each implementation slice to one narrow behavioral hypothesis.
- Require a rerun of the same MRFC slice after each meaningful runtime change.
- Fail oversized iterations fast instead of inferring causality from a bundled win.

### Risk 6. Observability Eats The Budget

Failure mode:
- The trace becomes so verbose that the child spends too much budget reporting itself rather than doing the task.

Mitigation:
- Keep full payloads optional and bounded.
- Default to compact ledgers and compact step notes.
- Allow detail escalation only when the parent requests deeper inspection.

### Risk 7. Hidden Wrapper Drift Returns Through The Back Door

Failure mode:
- The tool avoids upstream hidden orchestration pressure but then reintroduces similar hidden behavior through its own wrapper text.

Mitigation:
- Keep wrapper policy explicit and visible in the request/result contract.
- Limit wrapper content to runtime infrastructure and explicit lane posture.
- Treat any posture-changing wrapper as a request-level choice, not as an invisible default.

### Risk 8. The Child Becomes Hard To Use Because It Fails Too Often

Failure mode:
- A strong falsification contract makes the child reject too many tasks and becomes operationally useless.

Mitigation:
- Separate `complete`, `partial`, and `unresolved` outcomes cleanly.
- Treat useful partial traces as acceptable evidence rather than as total failure.
- Optimize first for honest bounded assistance, not for all-or-nothing completion.

## Phase Gates

Do not widen scope unless the previous gate is satisfied.

### Gate A. Contract Freeze

- The result shape is stable enough that parent and child can both rely on it.
- `expectedButMissing`, `stopReason`, and `completionClaim` are still explicit.

### Gate B. Runtime Truthfulness

- At least one meaningful slice shows that the returned tool ledger matches actual observed tool activity closely enough to be useful.
- If runtime-observed and child-reported trace disagree, the disagreement is surfaced rather than silently normalized.
- Native `runSubagent` delegation, when used, is visibly marked as opaque rather than silently merged into local trace truth.

### Gate C. Parent Falsification Works

- The parent can reject a child run that claims completion while missing expected steps.
- The parent can also accept a trace-supported partial result without forcing false failure.

### Gate D. MRFC Delta Is Real

- The Tiinex-owned lane shows at least one reproducible falsifiability advantage over the upstream path on the same slice.
- If no meaningful delta appears, stop expanding the runtime until the cause is clearer.

## Kill Conditions

Pause or reset the slice if any of these happen.

- The child result shape starts changing every pass, making comparison unstable.
- The parent cannot tell whether the tool ledger is child-reported or runtime-observed.
- The implementation adds broad capability before one narrow MRFC slice is clean.
- The parent still ends up trusting summary text over trace in real usage.
- Observability overhead grows enough that the child can no longer complete the narrow task family reliably.
- The runtime quietly reintroduces hidden posture-shifting wrapper logic.

## Suggested First Delivery Order

1. Freeze the compact result contract.
2. Define parent-side classification rules.
3. Implement one narrow runtime prototype with compact tool ledger capture.
4. Run one MRFC slice and record the first falsifiable delta.
5. Only then decide whether more tool families or richer trace depth are justified.

## Current Recommendation

- Yes, better transparency than upstream `runSubagent` output is necessary.
- Your proposed requirement is the right bar: the parent must be able to falsify skipped expected work.
- The first design move should therefore be a traceability-first subagent contract, not a feature-first generic child agent.