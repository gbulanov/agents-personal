---
description: CI/CD pipeline conventions for GitHub Actions, ArgoCD, and general pipelines
paths:
  - ".github/workflows/**"
  - "**/*pipeline*"
  - "**/*jenkinsfile*"
  - "**/.gitlab-ci*"
  - "**/argocd/**"
  - "**/*argo*application*"
---

# CI/CD Conventions

## GitHub Actions
- Pin action versions to SHA, not tags (`actions/checkout@abc123` not `@v4`)
- Set `timeout-minutes` on all jobs
- Use `concurrency` to prevent duplicate runs on the same branch
- Store secrets in GitHub Secrets, never hardcode
- Use `GITHUB_TOKEN` for GitHub API access (least-privilege by default)
- Cache dependencies (setup-node cache, actions/cache)
- Use matrix strategy for multi-version/multi-platform testing
- Separate CI (test) from CD (deploy) workflows
- Require manual approval (`environment: production`) for production deploys

## ArgoCD
- Use declarative Application manifests (not CLI-created apps)
- Enable auto-sync only for non-production environments
- Configure self-heal to correct manual drift
- Use sync waves for ordered deployments
- Set health checks for custom resources
- Use ApplicationSets for multi-cluster/multi-env patterns

## General Pipeline Principles
- Pipelines should be deterministic (same input = same output)
- Fail fast — run linters and unit tests before expensive steps
- Use artifacts to pass data between stages, not mutable state
- Tag and version all artifacts (Docker images, Helm charts)
- Never use `latest` tags in deployment pipelines
- Log enough context to debug failures without re-running
- Keep pipeline configs DRY — use reusable workflows/templates
