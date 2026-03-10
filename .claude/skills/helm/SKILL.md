---
name: helm
description: Helm operations — debug releases, diff values, render templates, lint charts, manage dependencies
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "<action: status|diff|template|lint|debug|history|deps> <target>"
---

# Helm Ops

Action: $ARGUMENTS

## Actions

### `status` <release> [namespace]
1. `helm status <release> -n <ns>`
2. `helm get values <release> -n <ns> --all`
3. Show release revision, chart version, status
4. Check pod health for the release

### `diff` <values-file-1> <values-file-2>
Structural diff of Helm values files:
1. Compare values semantically (not just text)
2. Categorize: added, removed, changed
3. Flag values that should match across environments (image version)
4. Flag values that should differ (replicas, domain)

### `template` <chart> [values-file]
1. `helm template <release> <chart> -f <values> --debug`
2. Validate rendered output
3. Check for empty/nil values that might cause issues
4. Show specific templates: `--show-only templates/<name>.yaml`

### `lint` <chart-dir>
1. `helm lint <chart-dir> -f values.yaml`
2. Check Chart.yaml metadata
3. Review _helpers.tpl for naming conventions
4. Check values.yaml for undocumented values
5. Verify NOTES.txt is helpful

### `debug` <release> [namespace]
Diagnose a failed or stuck release:
1. `helm history <release> -n <ns>` — check for failed revisions
2. `helm get manifest <release> -n <ns>` — rendered manifests
3. Check K8s events for the release resources
4. Common issues: pending-install, pending-upgrade, failed hooks

### `history` <release> [namespace]
1. `helm history <release> -n <ns>`
2. Show what changed between revisions
3. Identify which revision to rollback to

### `deps` <chart-dir>
1. `helm dependency list <chart-dir>`
2. Check for outdated dependencies
3. Verify repository availability
4. Check subchart value overrides
