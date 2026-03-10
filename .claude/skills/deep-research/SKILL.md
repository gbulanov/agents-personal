---
name: deep-research
description: Thoroughly research a codebase topic, architecture pattern, or technical question
disable-model-invocation: false
user-invocable: true
context: fork
agent: Explore
argument-hint: "<topic or question>"
---

# Deep Research

Thoroughly research the following topic in this codebase:

$ARGUMENTS

## Approach

1. **Identify relevant files** — Use Glob and Grep to find all files related to the topic
2. **Read and analyze** — Read the key files, understand the patterns and data flow
3. **Trace dependencies** — Follow imports, function calls, and data flow across files
4. **Map the architecture** — Understand how components connect and interact
5. **Document findings** — Provide a clear, structured summary

## Output Format

```
## Research: [topic]

### Overview
[2-3 sentence summary]

### Key Files
- `path/to/file.ts:42` — [what it does]
- ...

### Architecture
[How the pieces fit together, data flow, dependencies]

### Key Patterns
[Design patterns, conventions, or approaches used]

### Potential Issues
[Any concerns, tech debt, or areas for improvement]

### References
[Links to relevant docs, comments, or external resources found]
```

Be thorough. Read actual code, don't just search file names.
