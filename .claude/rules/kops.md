---
description: Kops cluster management conventions and safety rules
paths:
  - "**/kops/**"
  - "**/clusters/**"
  - "**/*kops*"
  - "**/*cluster*.yaml"
  - "**/*cluster*.yml"
---

# Kops Conventions

## Cluster Naming
- Use DNS-compatible names: `<env>.<team>.k8s.<domain>`
- Examples: `prod.platform.k8s.example.com`, `staging.data.k8s.example.com`
- Keep consistent naming across environments

## State Store
- Use a dedicated S3 bucket per AWS account with versioning enabled
- Bucket naming: `kops-state-<account-id>-<region>`
- Enable server-side encryption
- Set `KOPS_STATE_STORE` in environment or pass `--state` explicitly

## Cluster Spec Management
- Export and version control cluster specs: `kops get cluster -o yaml`
- Review diffs before applying changes
- Use `kops replace -f` for spec-driven changes over `kops edit`
- Keep a `clusters/` directory with specs per cluster

## Instance Groups
- Masters: always 3 (one per AZ), minimum m5.large
- Workers: separate by workload profile (general, compute, memory)
- Use `for_each` style naming: `nodes-<az>`, `spot-nodes-<az>`
- Set `cloudLabels` on every IG for cost allocation
- Set `nodeLabels` for workload scheduling
- Use `mixedInstancesPolicy` for spot with fallback to on-demand

## Upgrades
- Upgrade one minor K8s version at a time
- Upgrade kops binary before upgrading clusters
- Always dry-run first: `kops update cluster` without `--yes`
- Rolling update masters before nodes
- Validate after every step: `kops validate cluster`
- Schedule production upgrades during maintenance windows

## Security
- Private topology for production clusters
- Internal API load balancer (no public API endpoint)
- Enable etcd encryption at rest
- RBAC authorization (never ABAC)
- Use IRSA for pod-level AWS access
- Rotate SSH keys periodically
- Use SSM Session Manager instead of direct SSH

## Networking
- Cilium or Calico for CNI (avoid kubenet for production)
- Use node-local-dns addon for DNS performance
- Set appropriate pod and service CIDR ranges (plan for growth)
- Enable network policies

## Operations
- Never apply and rolling-update in a single step — validate between them
- Use `--node-interval 2m` or longer for production rolling updates
- Always have PodDisruptionBudgets before rolling updates
- Monitor ASG activity during rolling updates
- Keep etcd backup strategy (automated snapshots)
