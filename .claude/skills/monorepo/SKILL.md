---
name: monorepo
description: Monorepo tooling — workspace setup, dependency management, build orchestration, shared types, CI optimization
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash, Edit, Write
argument-hint: "<action: setup|deps|build|shared-types|ci> <target>"
---

# Monorepo Management

Action: $ARGUMENTS

## Actions

### `setup` <tool>
Setup or configure monorepo tooling:
- **turborepo**: Initialize turbo.json, configure pipelines and caching
- **nx**: Initialize nx.json, configure targets and caching
- **pnpm**: Configure pnpm-workspace.yaml, .npmrc
- **npm**: Configure workspaces in root package.json
Structure: apps/, packages/, shared libraries

### `deps` [workspace]
Manage workspace dependencies:
1. List workspace dependency graph
2. Identify circular dependencies
3. Check for version mismatches across workspaces
4. Recommend workspace protocol usage
5. Optimize hoisting strategy

### `build` [issue]
Fix or optimize build pipeline:
1. Analyze turbo.json/nx.json task graph
2. Check `dependsOn` and `outputs` configuration
3. Optimize cache keys and outputs
4. Ensure correct build order
5. Configure remote caching for CI

### `shared-types` <description>
Setup shared type definitions:
1. Create shared types package
2. Configure exports and build
3. Setup consumers to import types
4. Configure TypeScript project references if applicable
5. Add API client generation if using OpenAPI/GraphQL

### `ci` [workflow-file]
Optimize CI for monorepo:
1. Configure affected-only builds (turbo/nx filtered runs)
2. Setup caching (Turborepo remote cache, npm cache)
3. Parallelize independent workspace builds
4. Configure change detection for conditional jobs
5. Optimize install step (pnpm fetch, npm ci)
