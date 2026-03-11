---
name: scaffold
description: Generate project scaffolds — Terraform modules, Helm charts, GitHub Actions workflows, service boilerplate
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash, Edit, Write
argument-hint: "<type: terraform-module|helm-chart|github-actions|service> <name>"
---

# Scaffold Generator

Type: $ARGUMENTS

Generate production-ready project scaffolds with best practices baked in.

## Templates

### `terraform-module` <name>
Create a Terraform module with proper structure:
```
modules/<name>/
├── main.tf           # Primary resources
├── variables.tf      # Input variables with descriptions and validation
├── outputs.tf        # Output values
├── versions.tf       # Required providers and terraform version
├── locals.tf         # Local values and computed expressions
├── README.md         # Module documentation (auto-generated)
└── examples/
    └── basic/
        └── main.tf   # Usage example
```

Requirements:
- All variables have `description` and `type`
- Sensitive variables marked `sensitive = true`
- Validation blocks on variables where applicable
- Outputs have descriptions
- Provider version constraints are set
- Tags variable with default empty map
- Follow naming convention: `<provider>_<resource>` for resource names

### `helm-chart` <name>
Create a Helm chart with production conventions:
```
charts/<name>/
├── Chart.yaml        # Chart metadata
├── values.yaml       # Default values with comments
├── templates/
│   ├── _helpers.tpl  # Template helpers (names, labels, selectors)
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── hpa.yaml
│   ├── pdb.yaml
│   ├── serviceaccount.yaml
│   ├── ingress.yaml  # Conditional
│   └── NOTES.txt     # Post-install instructions
└── tests/
    └── test-connection.yaml
```

Requirements:
- `_helpers.tpl` with standard labels (app.kubernetes.io/*)
- Resource limits and requests in values
- Liveness and readiness probes configured
- Security context (non-root, read-only rootfs, drop caps)
- HPA with sensible defaults
- PDB with minAvailable
- ServiceAccount with automountServiceAccountToken: false
- Conditional ingress with TLS support
- NOTES.txt with useful post-install info

### `github-actions` <workflow-type>
Generate CI/CD workflows. Types: `ci`, `cd`, `terraform`, `docker`, `release`.

**`ci`** — Build and test:
```yaml
on: [push, pull_request]
jobs: lint → test → build
```

**`cd`** — Deploy:
```yaml
on: push to main
jobs: build → push-image → deploy-staging → test → approve → deploy-prod
```

**`terraform`** — IaC pipeline:
```yaml
on: pull_request (plan), push to main (apply)
jobs: fmt-check → validate → plan → (approve) → apply
```

**`docker`** — Build and push:
```yaml
on: push (tags)
jobs: lint-dockerfile → build → scan → push
```

**`release`** — Semantic release:
```yaml
on: push to main
jobs: determine-version → changelog → github-release → notify
```

Requirements:
- Pin all actions to SHA (not tags)
- Set `timeout-minutes` on all jobs
- Use `concurrency` to prevent duplicate runs
- Cache dependencies
- Use OIDC for AWS auth (no long-lived keys)

### `service` <name>
Generate a service boilerplate:
```
services/<name>/
├── Dockerfile          # Multi-stage, non-root, distroless
├── .dockerignore       # Exclude .git, node_modules, etc.
├── docker-compose.yml  # Local development
├── k8s/
│   ├── deployment.yaml
│   ├── service.yaml
│   └── kustomization.yaml
├── .github/
│   └── workflows/
│       └── ci.yml
└── README.md
```
