---
name: refactor
description: Refactor code safely with analysis, plan, and verification
disable-model-invocation: true
user-invocable: true
argument-hint: "<file or description of what to refactor>"
---

# Safe Refactor

Refactor code with safety checks and verification.

## Target

$ARGUMENTS

## Process

### 1. Analyze
- Read the target code thoroughly
- Identify all callers and dependents (use Grep to find imports/references)
- Understand the current behavior and edge cases
- Note existing tests that cover this code

### 2. Plan
Present the refactoring plan to the user before making changes:
- What will change
- Why it's an improvement
- What risks exist
- What tests verify the behavior is preserved

### 3. Execute
- Make the changes incrementally
- Keep each change small and reviewable
- Update all callers and references
- Preserve the public API unless explicitly asked to change it

### 4. Verify
- Run existing tests to confirm behavior is preserved
- Check that all references were updated (grep for old names)
- Run the linter if available

## Refactoring Patterns
Apply these as appropriate:
- **Extract function** — Pull out repeated or complex logic
- **Rename** — Use clearer, more descriptive names
- **Simplify conditionals** — Replace nested if/else with early returns or guard clauses
- **Remove dead code** — Delete unused functions, variables, imports
- **Reduce coupling** — Use dependency injection, interfaces, or events
- **Flatten nesting** — Reduce indentation depth for readability

## Rules
- Never change behavior unless explicitly asked
- One refactoring concern per pass (don't mix rename + restructure)
- If tests don't exist for the target code, mention this before proceeding
- Don't over-abstract — three similar lines are better than a premature abstraction
