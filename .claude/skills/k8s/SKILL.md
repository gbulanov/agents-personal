---
name: k8s
description: Manage Kubernetes resources — generate manifests, debug pods, review configs, analyze clusters
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "<action: manifest|debug|review|status|rollback|scale|logs> [target]"
---

# Kubernetes Helper

Action: $ARGUMENTS

## Actions

### `manifest` <resource-description>
Generate Kubernetes manifests following best practices:
- Set resource requests AND limits
- Use `readinessProbe` and `livenessProbe` on all containers
- Set `securityContext` (non-root, read-only rootfs, drop capabilities)
- Add pod disruption budgets for production workloads
- Use `topologySpreadConstraints` or pod anti-affinity for HA
- Include `NetworkPolicy` when applicable
- Add proper labels: `app.kubernetes.io/name`, `app.kubernetes.io/version`, `app.kubernetes.io/component`
- Use `envFrom` with ConfigMaps/Secrets instead of inline env vars

### `debug` <pod-name or description>
1. `kubectl get pods` — check status, restarts, age
2. `kubectl describe pod <name>` — check events, conditions
3. `kubectl logs <name> --tail=100` — recent logs
4. `kubectl logs <name> --previous` — if crash-looping
5. Check common issues:
   - ImagePullBackOff: wrong image, missing pull secret
   - CrashLoopBackOff: read logs, check command/args, resource limits
   - Pending: scheduling issues, resource pressure, node affinity
   - OOMKilled: increase memory limit
   - Readiness probe failing: check endpoint, port, path
6. If multi-container, check each container and init containers

### `review` [path]
Review Kubernetes manifests for:
- Security: running as root, privileged, host network/PID
- Reliability: missing probes, no PDB, no resource limits
- Best practices: latest tag, missing labels, no namespace
- Networking: service selectors match pod labels, correct ports
- Storage: PVC sizing, storage class, access modes

### `status` [namespace]
1. `kubectl get pods -n <ns>` — pod health overview
2. `kubectl get events -n <ns> --sort-by='.lastTimestamp'` — recent events
3. `kubectl top pods -n <ns>` — resource usage
4. Flag any unhealthy pods, frequent restarts, or pending resources

### `rollback` <deployment>
1. `kubectl rollout history deployment/<name>` — show revisions
2. Show the diff between current and previous revision
3. Confirm with user before executing
4. `kubectl rollout undo deployment/<name>`
5. `kubectl rollout status deployment/<name>` — verify rollback

### `scale` <deployment> <replicas>
1. Show current replica count and resource usage
2. Calculate new resource impact
3. `kubectl scale deployment/<name> --replicas=<n>`
4. Watch rollout: `kubectl rollout status deployment/<name>`

### `logs` <pod-or-deployment> [options]
1. If deployment, find relevant pods first
2. `kubectl logs <pod> --tail=200 -f` for live tailing
3. For multi-container pods, show logs from each container
4. Suggest filtering patterns for common log formats

## Namespace Handling
- Always ask for namespace if not specified and not using `-A`
- Use `-n <namespace>` explicitly rather than relying on context
- Show the current context with `kubectl config current-context` first
