---
name: pr-review
description: Review a pull request for code quality, bugs, security, and best practices
disable-model-invocation: false
user-invocable: true
allowed-tools: Bash, Read, Grep, Glob
argument-hint: "[PR number or branch name]"
---

# Pull Request Review

Perform a thorough code review of a pull request.

## Steps

1. Identify the PR to review:
   - If `$ARGUMENTS` is a number, use `gh pr view $ARGUMENTS` and `gh pr diff $ARGUMENTS`
   - If `$ARGUMENTS` is a branch name, use `git diff main...$ARGUMENTS`
   - If no arguments, use `gh pr list` to show open PRs and ask which one

2. Gather context:
   - Read the PR description
   - Understand the full diff
   - Read surrounding code for modified files to understand context

3. Review for these categories:

### Correctness
- Logic errors or off-by-one bugs
- Unhandled edge cases or error paths
- Race conditions or concurrency issues
- Missing null/undefined checks at system boundaries

### Security
- Injection vulnerabilities (SQL, XSS, command)
- Authentication/authorization gaps
- Sensitive data exposure
- Unsafe deserialization

### Code Quality
- Clear naming and readability
- Appropriate abstraction level (not over-engineered)
- DRY violations (only flag if 3+ repetitions)
- Dead code or unused imports

### Performance
- N+1 queries or unnecessary database calls
- Missing indexes for queried fields
- Large memory allocations in loops
- Blocking operations in async contexts

### Testing
- Are new code paths covered by tests?
- Are edge cases tested?
- Do tests actually assert meaningful behavior?

4. Format findings as:
   ```
   ## PR Review: [title]

   ### Summary
   [1-2 sentence overview]

   ### Critical Issues (must fix)
   - ...

   ### Suggestions (nice to have)
   - ...

   ### Positive Notes
   - ...
   ```

5. Be constructive — explain *why* something is an issue and suggest a fix.
