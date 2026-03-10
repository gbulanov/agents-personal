---
name: infra-review
description: Review infrastructure code (Terraform, K8s manifests, Dockerfiles, CI/CD) for security, reliability, and best practices
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "[path or 'full' for entire repo]"
---

# Infrastructure Code Review

Review target: $ARGUMENTS

If "full" or no arguments, review the entire infrastructure codebase.

## Review Scope

### Terraform / OpenTofu
- [ ] State management: remote backend, state locking, encryption
- [ ] Provider versions pinned with pessimistic constraint (`~>`)
- [ ] No hardcoded secrets, account IDs, or region values
- [ ] All resources tagged (at minimum: Name, Environment, Owner, ManagedBy)
- [ ] Variables have descriptions, types, and validation where appropriate
- [ ] Sensitive variables marked with `sensitive = true`
- [ ] Lifecycle blocks on stateful resources (prevent_destroy, ignore_changes)
- [ ] `for_each` over `count` for stable resource identity
- [ ] Data sources used to reference existing infrastructure
- [ ] Outputs defined for values needed by other modules
- [ ] No `terraform_remote_state` data sources crossing team boundaries (use SSM/Secrets Manager)
- [ ] Modules versioned with git tags or registry versions

### Kubernetes Manifests / Helm Charts
- [ ] Resource requests AND limits set
- [ ] Readiness and liveness probes configured
- [ ] Security context: non-root, read-only rootfs, no privileged
- [ ] Pod disruption budgets for production workloads
- [ ] Network policies defined
- [ ] Secrets not stored in plain text (use ExternalSecrets, sealed-secrets, or SOPS)
- [ ] Image tags are immutable (not `latest`)
- [ ] Horizontal pod autoscaler configured where appropriate
- [ ] Service accounts with minimal RBAC

### Dockerfiles
- [ ] Multi-stage builds to minimize image size
- [ ] Specific base image version (not `latest`)
- [ ] Non-root USER directive
- [ ] COPY over ADD (unless extracting archives)
- [ ] .dockerignore present
- [ ] No secrets in build args or layers
- [ ] HEALTHCHECK instruction present
- [ ] Minimal final image (distroless or alpine)

### CI/CD Pipelines
- [ ] Secrets managed via CI/CD secret store (not in code)
- [ ] Pipeline steps have timeouts
- [ ] Deployment has manual approval for production
- [ ] Rollback mechanism exists
- [ ] Artifact signing or verification
- [ ] Branch protection on main/master

## Output Format

```
## Infrastructure Review: [scope]

### Risk Level: [LOW | MEDIUM | HIGH | CRITICAL]

### Critical Findings
1. **[Title]** — `file:line`
   - Issue: ...
   - Risk: ...
   - Fix: ...

### Security Concerns
1. ...

### Reliability Improvements
1. ...

### Cost Optimization
1. ...

### Best Practice Gaps
1. ...
```
