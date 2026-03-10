---
name: network-debug
description: Debug network connectivity — DNS, security groups, NACLs, VPC routing, K8s networking, load balancers, service mesh
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "<source> cannot reach <target> [port]"
---

# Network Debugger

Problem: $ARGUMENTS

## Systematic Debug Process

### Step 1: Identify Endpoints
Parse the source and target from the description. Determine:
- Is this pod-to-pod, pod-to-service, pod-to-external, or external-to-cluster?
- Which namespace, VPC, account?

### Step 2: DNS
```bash
kubectl exec <source-pod> -- nslookup <target>
# If fails: check CoreDNS pods, /etc/resolv.conf, search domains
```

### Step 3: Kubernetes Network Layer
```bash
kubectl get svc <target-svc> -n <ns>           # Service exists?
kubectl get endpoints <target-svc> -n <ns>       # Endpoints populated?
kubectl get networkpolicy -n <ns>                 # Policies blocking?
```

### Step 4: AWS Network Layer
```bash
aws ec2 describe-security-groups --group-ids <sg>   # Port allowed?
aws ec2 describe-network-acls --filters ...          # NACL rules?
aws ec2 describe-route-tables --filters ...          # Route exists?
```

### Step 5: Connectivity Test
```bash
kubectl exec <source-pod> -- nc -zv <target> <port>  # TCP connect
kubectl exec <source-pod> -- curl -v <target-url>     # HTTP
```

### Step 6: Report
```
## Network Diagnosis: [source] → [target]

| Layer | Status | Detail |
|-------|--------|--------|
| DNS | ✅/❌ | ... |
| K8s Network | ✅/❌ | ... |
| Security Groups | ✅/❌ | ... |
| Routing | ✅/❌ | ... |

### Root Cause: [specific issue]
### Fix: [exact change needed]
```
