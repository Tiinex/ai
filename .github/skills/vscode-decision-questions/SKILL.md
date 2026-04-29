---
name: vscode-decision-questions
description: 'Use when a small set of simple user decisions can be captured faster and more safely with vscode_askQuestions, especially yes/no, fixed-choice, priority selection, or short clarification in VS Code.'
argument-hint: 'A few bounded decisions, for example target environment, preferred option, or whether to proceed.'
user-invocable: false
---

# VS Code Decision Questions

Use this skill when you are working inside VS Code and the missing user input is small, bounded, and decision-shaped rather than exploratory.

## When To Use

- You need 1 to 5 simple decisions to unblock the next concrete step.
- The choices are known or can be expressed as a short list of options.
- A yes or no, one-of-many, multi-select, or short fallback answer is enough.
- Freeform chat would likely slow the task down or blur scope.

## When Not To Use

- The user is brainstorming, reflecting, or still defining the problem.
- The question is inferentially sensitive and needs explanation before a choice is meaningful.
- You need long-form nuance more than speed or control.

## Preferred Pattern

1. Use as few questions as possible.
2. Prefer fixed options when the decision space is already known.
3. Mark the recommended default when there is a defensible best path.
4. Allow freeform only when it materially improves the decision.
5. Phrase the question in the user's current language when that is clear.
6. Use the answer immediately to unblock the next concrete action.

## Good Fits

- Choosing between a few implementation paths.
- Confirming scope for a narrow edit.
- Selecting target environment, project, or mode.
- Gathering quick approval for a reversible action.

## Fallback

If `vscode_askQuestions` is unavailable or the environment is not VS Code, fall back to ordinary chat questions without pretending the structured tool exists.