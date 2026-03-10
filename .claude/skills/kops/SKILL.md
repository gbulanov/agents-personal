---
name: kops
description: Manage Kops Kubernetes clusters — create, update, validate, upgrade, troubleshoot, rotate, and drain
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "<action> [cluster-name or args]"
---

# Kops Cluster Manager

Action: $ARGUMENTS

## Actions

### `status` [cluster-name]
Full health check of a Kops cluster:
1. `kops validate cluster [--name <cluster>]` — overall cluster validation
2. `kops get clusters` — list all clusters if no name given
3. `kops get ig --name <cluster>` — instance group status
4. `kubectl get nodes -o wide` — node status, versions, IPs, AZ placement
5. `kubectl get pods -A | grep -v Running | grep -v Completed` — unhealthy pods
6. `kubectl top nodes` — resource utilization
7. `kubectl get events -A --sort-by='.lastTimestamp' | tail -20` — recent events
8. Summarize: cluster version, node count per IG, health issues, resource pressure

### `get` [cluster-name]
Inspect cluster configuration:
1. `kops get cluster <name> -o yaml` — full cluster spec
2. `kops get ig --name <name>` — all instance groups
3. For each IG: `kops get ig <ig-name> --name <name> -o yaml` — full IG spec
4. Summarize: topology, networking (Calico/Cilium/etc), API access, etcd config, addon versions

### `create` <cluster-name>
Guide through cluster creation:
1. Gather requirements:
   - Region and AZs
   - Topology (public/private)
   - Node count and instance types
   - Kubernetes version
   - Networking CNI (Calico, Cilium, AWS VPC)
   - State store S3 bucket
2. Generate the `kops create cluster` command with best-practice flags:
   ```
   kops create cluster \
     --name=<name> \
     --state=s3://<bucket> \
     --zones=<zones> \
     --master-zones=<zones> \
     --master-count=3 \
     --master-size=<type> \
     --node-count=<n> \
     --node-size=<type> \
     --networking=cilium \
     --topology=private \
     --api-loadbalancer-type=internal \
     --authorization=RBAC \
     --cloud-labels="Environment=<env>,Team=<team>,ManagedBy=kops" \
     --encrypt-etcd-storage \
     --yes
   ```
3. Show the cluster spec for review before applying
4. Recommend post-creation steps (validate, deploy addons, set up monitoring)

### `edit` <cluster-name> [component]
Edit cluster or instance group configuration:
1. `kops get cluster <name> -o yaml > /tmp/cluster-spec.yaml` — export current spec
2. Show current configuration for the component being edited
3. Suggest changes based on what the user wants
4. Apply with `kops replace -f /tmp/cluster-spec.yaml`
5. `kops update cluster <name> --yes` — apply changes
6. If changes require rolling update: `kops rolling-update cluster <name> --yes`

### `update` <cluster-name>
Apply pending cluster changes:
1. `kops update cluster <name>` — preview changes (dry run)
2. Show what will change (new ASGs, launch configs, security groups, etc.)
3. Flag destructive changes prominently
4. Confirm with user before: `kops update cluster <name> --yes`
5. Check if rolling update needed: `kops rolling-update cluster <name>`
6. If needed, confirm and run: `kops rolling-update cluster <name> --yes`
7. `kops validate cluster <name>` — post-update validation

### `upgrade` <cluster-name> [target-version]
Upgrade Kubernetes version:
1. `kops get cluster <name> -o yaml | grep kubernetesVersion` — current version
2. Show available versions and recommended upgrade path
3. Check for breaking changes in the target version:
   - Deprecated APIs (`kubectl get --raw /metrics | grep apiserver_requested_deprecated_apis` or check release notes)
   - Changed defaults
   - Removed features
4. Pre-upgrade checklist:
   - [ ] Backup etcd: `kops get cluster <name> -o yaml > cluster-backup.yaml`
   - [ ] Check all IGs are healthy: `kops validate cluster <name>`
   - [ ] Verify PodDisruptionBudgets exist for critical workloads
   - [ ] Run `kubectl api-resources` to inventory used APIs
   - [ ] Check addon compatibility with target version
5. Upgrade process:
   ```
   kops edit cluster <name>  # Change kubernetesVersion
   kops update cluster <name> --yes
   kops rolling-update cluster <name> --yes
   ```
6. Post-upgrade validation:
   - `kops validate cluster <name>`
   - `kubectl get nodes` — verify all nodes on new version
   - `kubectl get pods -A` — verify workloads healthy
   - Run smoke tests if available

### `rolling-update` <cluster-name> [options]
Perform a rolling update:
1. `kops rolling-update cluster <name>` — preview what needs updating
2. Show which IGs need updates and why
3. Options to discuss:
   - `--node-interval` — time between node replacements (default 15s, recommend 2m+ for prod)
   - `--master-interval` — time between master replacements
   - `--fail-on-validate-error` — stop if validation fails
   - `--drain-timeout` — max time to drain a node
   - `--force` — force update even if validation passes (use carefully)
4. Confirm with user before executing
5. Monitor progress: `kops rolling-update cluster <name> --yes`
6. Post-update: `kops validate cluster <name>`

### `ig` <cluster-name> <action> [ig-name]
Instance group management:
- `ig <cluster> list` — list all IGs with sizes and instance types
- `ig <cluster> get <ig-name>` — show IG spec
- `ig <cluster> add <ig-name>` — create new IG (spot, GPU, ARM, etc.)
- `ig <cluster> resize <ig-name> <min> <max>` — change size limits
- `ig <cluster> type <ig-name> <instance-type>` — change instance type
- `ig <cluster> spot <ig-name>` — convert to spot/mixed instances

When creating new IGs, include:
- `machineType`, `minSize`, `maxSize`
- `nodeLabels` for workload targeting
- `taints` if specialized (GPU, high-memory)
- `cloudLabels` for cost tracking
- `mixedInstancesPolicy` for spot if appropriate

### `drain` <node-name>
Safely drain a node:
1. `kubectl get pods --field-selector spec.nodeName=<node> -A` — show affected pods
2. Check for pods without PDBs or with local storage
3. `kubectl drain <node> --ignore-daemonsets --delete-emptydir-data --grace-period=120`
4. Verify pods rescheduled: `kubectl get pods -A -o wide | grep -v <node>`
5. Cordon if drain without removal: `kubectl cordon <node>`

### `certs` <cluster-name>
Certificate management:
1. Check certificate expiry dates
2. Show CA and component certificate status
3. Guide through rotation if needed:
   - `kops update cluster <name> --yes` (regenerates certs)
   - Rolling update to distribute new certs

### `etcd` <cluster-name> [action]
etcd operations:
- `etcd <cluster> status` — member list, health, DB size
- `etcd <cluster> backup` — guide through etcd backup
- `etcd <cluster> defrag` — defragment etcd (if DB size > 4GB)

### `addons` <cluster-name> [action]
Cluster addon management:
1. Show current addon status (DNS, metrics-server, cluster-autoscaler, etc.)
2. Check addon versions vs latest
3. Guide through addon updates via cluster spec

### `debug` <cluster-name> <issue-description>
Troubleshoot cluster issues:
1. **Node NotReady**:
   - `kubectl describe node <name>` — conditions, capacity, allocatable
   - Check kubelet logs: `journalctl -u kubelet` (via SSM or SSH)
   - Check system pods on the node
   - Common causes: disk pressure, memory pressure, PID pressure, network
2. **API server issues**:
   - `kops validate cluster` — control plane health
   - Check master node status and etcd health
   - Review API server logs
3. **Networking issues**:
   - CNI pod status (Calico/Cilium)
   - kube-proxy pods
   - CoreDNS/kube-dns health
   - Cross-AZ connectivity
4. **Scaling issues**:
   - ASG status in AWS console/CLI
   - Instance launch failures (capacity, quotas, AMI)
   - Cluster autoscaler logs
5. **etcd issues**:
   - Member health and leader election
   - Disk latency (etcd is disk-sensitive)
   - DB size and compaction
6. **Upgrade failures**:
   - Nodes stuck in old version
   - Rolling update stuck
   - Validation failures after update

### `export` <cluster-name>
Export cluster configuration:
1. `kops get cluster <name> -o yaml` — cluster spec
2. `kops get ig --name <name> -o yaml` — all instance groups
3. `kops get sshpublickey --name <name>` — SSH keys
4. Save to files for version control or disaster recovery

### `delete` <cluster-name>
**DANGEROUS** — Delete a cluster:
1. Show full cluster details and all resources that will be deleted
2. List all workloads running on the cluster
3. Warn about data loss (PVs, etcd, etc.)
4. Require explicit user confirmation (show the exact command but DO NOT execute)
5. `kops delete cluster <name> --yes` — user must run this themselves

## Best Practices Applied
- Always validate after any change: `kops validate cluster`
- Use `--yes` only after reviewing dry-run output
- Keep cluster specs in version control
- Use node-local-dns for DNS performance
- Enable etcd encryption
- Use private topology for production
- Set proper `maxUnavailable` on instance groups for safe rolling updates
- Tag all resources for cost tracking
- Use mixed instance policies for cost savings on worker nodes
