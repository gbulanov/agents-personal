---
name: yaml
description: Validate, fix, diff, and transform YAML files with schema awareness for K8s, Helm, kops, GitHub Actions
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "<action: validate|fix|diff|convert|merge> <file or path>"
---

# YAML Surgeon

Action: $ARGUMENTS

## Actions

### `validate` <file>
1. Parse YAML syntax — report errors with line numbers
2. Detect the schema (K8s resource, Helm values, kops spec, GH Actions, compose)
3. Validate against schema:
   - Required fields present
   - Correct types and allowed values
   - Cross-references valid (selectors match labels, ports consistent)
   - API version not deprecated
4. Check for common YAML pitfalls:
   - Tab characters (must be spaces)
   - `yes`/`no`/`on`/`off` interpreted as booleans
   - Unquoted strings that look like numbers/dates
   - Duplicate keys
   - Trailing whitespace in multi-line strings

### `fix` <file>
1. Validate first (as above)
2. For each issue found, show the fix:
   - Current line with problem
   - Corrected version
   - Explanation of why

### `diff` <file1> <file2>
1. Structural diff (semantic, not text)
2. Categorize changes:
   - **Added** fields/resources
   - **Removed** fields/resources
   - **Changed** values
   - **Moved** (restructured but same content)
3. Flag breaking changes
4. Ignore formatting-only differences

### `convert` <file> <target-format>
Convert between formats:
- YAML ↔ JSON
- Kustomize → plain manifests: `kubectl kustomize <dir>`
- Helm → plain manifests: `helm template <chart> -f values.yaml`
- docker-compose → K8s manifests (conceptual mapping)

### `merge` <base-file> <overlay-file>
Strategic merge of YAML files:
1. Show base values
2. Show overlay overrides
3. Show merged result
4. Flag conflicts
