---
name: doc-gen
description: Generate documentation for code — functions, modules, APIs, or architecture
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob
argument-hint: "<file path or module name>"
---

# Documentation Generator

Generate clear, useful documentation for: $ARGUMENTS

## Steps

1. **Read the code** — Read the target file(s) thoroughly
2. **Understand the API surface** — Identify exports, public functions, classes, types
3. **Trace usage** — Grep for imports/usage of the target to understand how it's consumed
4. **Generate docs** — Write documentation appropriate to the type:

### For a function/method:
```
## `functionName(params): returnType`

Brief description of what it does.

### Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| param1 | string | yes | What it is |

### Returns
`ReturnType` — Description

### Example
\`\`\`typescript
const result = functionName('input');
\`\`\`

### Notes
- Edge cases, gotchas, or important behavior
```

### For a module/file:
```
## ModuleName

Overview of what this module does and its role in the system.

### Exports
- `export1` — description
- `export2` — description

### Dependencies
- What it imports and why

### Usage
How other parts of the codebase use this module.
```

### For an API endpoint:
```
## `METHOD /path`

Description.

### Request
- Headers, body, query params

### Response
- Status codes, body shape

### Example
\`\`\`
curl -X POST /api/example -d '{"key": "value"}'
\`\`\`
```

## Rules
- Be concise — developers read docs to save time
- Include real examples from the codebase where possible
- Document behavior, not implementation details
- Flag undocumented edge cases or surprising behavior
