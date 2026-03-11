---
name: docker
description: Docker & container security — Dockerfile review, image hardening, supply chain security, runtime security policies
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "<action: review|scan|harden|compose> <file or image>"
---

# Docker & Container Security

Action: $ARGUMENTS

## Actions

### `review` <Dockerfile>
Review a Dockerfile for security and best practices:
1. Base image: pinned version? minimal image? distroless?
2. User: runs as non-root?
3. Multi-stage build: no build tools in final image?
4. Secrets: no credentials in ARG/ENV/COPY?
5. Layer hygiene: combined RUN, clean cache?
6. COPY vs ADD usage
7. HEALTHCHECK instruction present
8. Signal handling (exec form, tini)
9. .dockerignore excludes sensitive files

### `scan` <image>
Analyze image for vulnerabilities:
1. `trivy image <image>` or `grype <image>` if available
2. Categorize CVEs by severity and fixability
3. Identify which layer introduced each vulnerability
4. Recommend base image updates or package patches
5. Check image size and suggest reduction

### `harden` <Dockerfile or K8s manifest>
Generate hardened version:
1. Switch to minimal base image
2. Add non-root user
3. Enable read-only root filesystem
4. Drop all capabilities
5. Disable privilege escalation
6. Add seccomp profile
7. Set resource limits
8. Remove unnecessary packages

### `compose` <docker-compose.yml>
Review docker-compose for security:
1. Privileged mode usage
2. Host volume mounts of sensitive paths
3. Secrets in environment variables
4. Unnecessary port exposure
5. Network segmentation
6. Health check configuration
7. Resource limits
