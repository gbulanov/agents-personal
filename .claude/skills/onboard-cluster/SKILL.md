---
name: onboard-cluster
description: Map a Kubernetes cluster — inventory workloads, check health, review Helm releases, assess capacity
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "[cluster-name or context]"
---

# Cluster Onboarding (Composite)

Cluster: $ARGUMENTS

Map and assess a Kubernetes cluster by gathering information across all dimensions. This is for understanding an unfamiliar cluster quickly.

## Step 1: Cluster Overview
```bash
kubectl cluster-info
kubectl get nodes -o wide
kubectl version --short 2>/dev/null || kubectl version
kubectl get namespaces
```
- Cluster version, node count, node types
- Namespace inventory

## Step 2: Workload Inventory
```bash
kubectl get deployments -A --no-headers | wc -l
kubectl get statefulsets -A --no-headers | wc -l
kubectl get daemonsets -A --no-headers | wc -l
kubectl get cronjobs -A --no-headers | wc -l
kubectl get pods -A --field-selector=status.phase!=Running,status.phase!=Succeeded 2>/dev/null
```
- Count of each workload type
- Any unhealthy pods

## Step 3: Helm Releases
```bash
helm list -A --output table
```
- Chart versions, app versions, status
- Any failed releases

## Step 4: Capacity Assessment
```bash
kubectl top nodes 2>/dev/null
kubectl describe nodes | grep -A 5 "Allocated resources"
```
- Node utilization (CPU, memory)
- Allocated vs capacity

## Step 5: Networking
```bash
kubectl get svc -A --no-headers | grep -c LoadBalancer
kubectl get ingress -A 2>/dev/null
kubectl get networkpolicy -A --no-headers 2>/dev/null | wc -l
```
- Load balancers, ingress controllers
- Network policies in place?

## Step 6: Security Posture
```bash
kubectl get podsecuritypolicies 2>/dev/null || echo "No PSPs (expected on newer clusters)"
kubectl get clusterroles --no-headers | wc -l
kubectl get secrets -A --no-headers | wc -l
```
- RBAC complexity
- Secret count

## Output

```
## Cluster Map: [name]

### Overview
| Property | Value |
|----------|-------|
| Version | ... |
| Nodes | X (types: ...) |
| Namespaces | X |

### Workloads
| Type | Count | Healthy | Issues |
|------|-------|---------|--------|

### Helm Releases
| Release | Namespace | Chart | Version | Status |
|---------|-----------|-------|---------|--------|

### Capacity
| Node | CPU Used/Alloc | Mem Used/Alloc | Pods |
|------|---------------|----------------|------|

### Networking
- Load Balancers: X
- Ingress rules: X
- Network Policies: X

### Health Issues
1. [issue and affected resource]

### Recommendations
1. [priority action]
```
