---
description: Kubernetes manifest and Helm chart conventions
paths:
  - "**/*.yaml"
  - "**/*.yml"
  - "**/k8s/**"
  - "**/kubernetes/**"
  - "**/manifests/**"
  - "**/helm/**"
  - "**/charts/**"
---

# Kubernetes Conventions

## Pod Spec
- Always set resource `requests` AND `limits`
- Configure `readinessProbe` and `livenessProbe` (prefer HTTP over exec)
- Set `startupProbe` for slow-starting containers
- Use `securityContext`:
  - `runAsNonRoot: true`
  - `readOnlyRootFilesystem: true`
  - `allowPrivilegeEscalation: false`
  - `capabilities: { drop: ["ALL"] }`
- Never use `latest` tag — pin image versions with SHA or semver
- Use `imagePullPolicy: IfNotPresent` for tagged images

## Labels
Use standard labels on all resources:
```yaml
labels:
  app.kubernetes.io/name: <app>
  app.kubernetes.io/version: <version>
  app.kubernetes.io/component: <component>
  app.kubernetes.io/part-of: <system>
  app.kubernetes.io/managed-by: <tool>
```

## Deployments
- Set `revisionHistoryLimit` (default 10 is usually fine)
- Configure `strategy` (RollingUpdate with maxSurge/maxUnavailable)
- Use `topologySpreadConstraints` for HA across AZs
- Create `PodDisruptionBudget` for production workloads

## Services
- Match selector labels exactly to pod labels
- Name ports explicitly
- Use `ClusterIP` unless external access needed
- Prefer `Ingress` over `LoadBalancer` type services

## ConfigMaps & Secrets
- Use `envFrom` to mount as environment variables
- Use volume mounts for file-based configs
- Never store secrets in plain YAML — use ExternalSecrets, SealedSecrets, or SOPS
- Set `immutable: true` on ConfigMaps when values won't change

## Namespaces
- One namespace per application or team
- Apply ResourceQuotas and LimitRanges per namespace
- Use NetworkPolicies to isolate namespace traffic
