---
description: Dockerfile and container conventions
paths:
  - "**/Dockerfile*"
  - "**/.dockerignore"
  - "**/docker-compose*.yml"
  - "**/docker-compose*.yaml"
---

# Docker Conventions

## Dockerfile
- Use multi-stage builds to minimize image size
- Pin base image versions (`node:20.11-alpine`, not `node:latest`)
- Use distroless or alpine-based images for production
- Run as non-root user (`USER 1001`)
- Use `COPY` over `ADD` (unless extracting tar)
- Order layers from least to most frequently changed
- Combine `RUN` commands to reduce layers
- Add `HEALTHCHECK` instruction
- Don't install unnecessary packages
- Clean package manager caches in the same layer

## .dockerignore
Always include:
```
.git
node_modules
*.md
.env*
.terraform
**/*.tfstate*
```

## Security
- No secrets in build args, env vars, or layers
- Scan images with `trivy` or equivalent
- Use `--no-cache` for CI builds
- Sign images when possible
- Pin package versions in `apt-get`/`apk`
