---
description: Helm chart authoring conventions
paths:
  - "**/Chart.yaml"
  - "**/values.yaml"
  - "**/templates/**"
  - "**/charts/**"
---

# Helm Chart Conventions

- Use `app.kubernetes.io/*` standard labels via `_helpers.tpl`
- All resource names use `{{ include "<chart>.fullname" . }}` — never hardcode
- Default to secure settings: non-root user, read-only rootfs, drop all capabilities
- Always set resource requests and limits in default values
- Include liveness and readiness probes with sensible defaults
- Make image tag configurable — never hardcode, default to `Chart.appVersion`
- Use `{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}`
- Document every value in `values.yaml` with comments
- Use `{{- if .Values.ingress.enabled }}` for optional resources
- Use `nindent` for indentation — `{{ include "chart.labels" . | nindent 4 }}`
- Pin dependency versions in `Chart.yaml` — no ranges for production
- Include `NOTES.txt` with post-install access instructions
- Include PodDisruptionBudget for production workloads
- Include HPA with configurable min/max replicas
- Use `{{ required "value is required" .Values.foo }}` for mandatory values
