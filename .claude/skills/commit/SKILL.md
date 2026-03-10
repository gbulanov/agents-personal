---
name: commit
description: Create a well-structured git commit with conventional commit format
disable-model-invocation: true
user-invocable: true
allowed-tools: Bash, Read, Grep, Glob
argument-hint: "[optional: commit scope or description]"
---

# Smart Commit

Create a git commit following Conventional Commits format.

## Steps

1. Run `git status` to see all changed files
2. Run `git diff --staged` to see staged changes. If nothing is staged, run `git diff` to see unstaged changes
3. Analyze the changes and determine:
   - **Type**: feat, fix, refactor, docs, test, chore, style, perf, ci, build
   - **Scope** (optional): the area of the codebase affected
   - **Description**: concise summary of what changed and why
   - **Breaking changes**: if any
4. If nothing is staged, suggest which files to stage based on logical grouping
5. Draft the commit message in this format:
   ```
   type(scope): description

   [optional body with more detail]

   [optional footer for breaking changes]
   ```
6. Present the commit message to the user for approval
7. Create the commit

If the user provided arguments: $ARGUMENTS — use that as guidance for the commit scope or message.

## Rules
- Keep the subject line under 72 characters
- Use imperative mood ("add feature" not "added feature")
- The body should explain *why*, not *what* (the diff shows what)
- Group related changes into a single commit
- Never commit .env files, secrets, or credentials
