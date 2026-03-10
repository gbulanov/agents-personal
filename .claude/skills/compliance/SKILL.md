---
name: compliance
description: Check infrastructure against CIS benchmarks, SOC2 controls, PCI requirements, and AWS best practices
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "<framework: cis-aws|cis-k8s|soc2|pci|all> [scope]"
---

# Compliance Checker

Framework: $ARGUMENTS

## Audit Process

1. **Scope** — Determine which framework(s) and resources to audit
2. **Scan** — Check infrastructure code (Terraform) and live configs (AWS CLI, kubectl)
3. **Assess** — Evaluate each control
4. **Report** — Findings with severity, evidence, and remediation

## Frameworks

### `cis-aws` — CIS AWS Foundations Benchmark
Key areas: IAM, logging, monitoring, networking, storage encryption

### `cis-k8s` — CIS Kubernetes Benchmark
Key areas: control plane, worker nodes, policies, network, secrets

### `soc2` — SOC2 Trust Service Criteria
Key areas: access control, change management, monitoring, backup

### `pci` — PCI-DSS
Key areas: segmentation, encryption, access control, logging, authentication

### `all` — Run all applicable frameworks

## Output

```
## Compliance Report: [Framework]

### Score: X/Y controls passing (Z%)

### Critical Failures
1. [Control ID] — [description, evidence, fix]

### Warnings
1. ...

### Remediation Priority
| Priority | Control | Effort | Fix |
|----------|---------|--------|-----|
| P1 | ... | Low | ... |
```

Each finding includes the specific Terraform or K8s change needed to fix it.
