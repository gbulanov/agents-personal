# Personal Agent Agency

A collection of reusable [Claude Code](https://docs.anthropic.com/en/docs/claude-code) agents and skills for DevOps, SRE, cloud engineering, application development, and software engineering workflows.

**37 agents** | **52 skills** | **29 rule files** — ready to drop into any project.

## What This Is

A personal library of Claude Code extensions:

- **Agents** — specialized subagents that Claude delegates to automatically for complex tasks
- **Skills** — slash commands (`/terraform`, `/java`, `/frontend`, etc.) that encode repeatable workflows
- **Rules** — context-specific coding conventions applied automatically based on file patterns
- **Hooks** — lifecycle scripts (pre-commit secret scanning, post-edit validation)

Clone or symlink the `.claude/` directory into any project to get a fully-equipped AI-powered toolkit.

## Quick Start

```bash
# Clone the repo
git clone <repo-url> ~/agents-personal

# Symlink into an existing project
ln -s ~/agents-personal/.claude /path/to/your/project/.claude

# Use Claude Code as normal — agents and skills are auto-discovered
claude
```

Example commands:
```
> /terraform plan
> /k8s debug my-pod
> /java new service UserService
> /frontend component Button react
> /test generate src/services/auth.ts
> /deploy-review
> /tech-debt
```

---

## Skills Reference

### DevOps & Infrastructure (18 skills)

| Skill | Actions | Description |
|-------|---------|-------------|
| `/terraform` | `plan` `validate` `fmt` `new-module` `import` `migrate` `debug` | Terraform operations and code generation |
| `/k8s` | `manifest` `debug` `review` `status` `rollback` `scale` `logs` | Kubernetes operations |
| `/kops` | `status` `get` `create` `edit` `update` `upgrade` `rolling-update` `ig` `drain` `certs` `etcd` `addons` `debug` `export` `delete` | Kops cluster lifecycle |
| `/helm` | `status` `diff` `template` `lint` `debug` `history` `deps` | Helm chart operations |
| `/aws` | `query` `debug` `iam` `sg` `logs` `costs` `whoami` | AWS operations |
| `/iam` | `analyze` `policy` `role` `audit` `irsa` | IAM analysis |
| `/incident` | `investigate` `mitigate` `postmortem` `runbook` | Incident response |
| `/infra-review` | — | IaC review |
| `/cost-review` | — | Cost optimization |
| `/compliance` | `cis-aws` `cis-k8s` `soc2` `pci` `all` | Compliance audits |
| `/capacity` | `analyze` `rightsize` `forecast` `nodes` | Capacity planning |
| `/secrets` | `scan` `audit` `rotation` `review` | Secret management |
| `/monitor` | `alerts` `slo` `dashboards` `cloudwatch` `review` | Monitoring & SLOs |
| `/db` | `review` `optimize` `health` `migration` `connections` | Database ops |
| `/docker` | `review` `scan` `harden` `compose` | Container security |
| `/deps` | `audit` `outdated` `licenses` `upgrade-plan` | Dependency management |
| `/dns` | `query` `debug` `audit` `records` | DNS operations |
| `/dr` | `audit` `plan` `runbook` `test` | Disaster recovery |

### Networking & Debugging (6 skills)

| Skill | Actions | Description |
|-------|---------|-------------|
| `/network-debug` | `<source> cannot reach <target>` | Network diagnosis |
| `/logs` | `k8s` `cloudwatch` `file` `system` | Log analysis |
| `/yaml` | `validate` `fix` `diff` `convert` `merge` | YAML operations |
| `/pipeline` | `debug` `review` `create` `status` | CI/CD pipelines |
| `/loadtest` | `generate` `analyze` `plan` | Load testing |
| `/api-review` | `review` `breaking` `validate` `design` | API design review |

### Application Development (14 skills)

| Skill | Actions | Description |
|-------|---------|-------------|
| `/java` | `new` `debug` `spring` `build` `migrate` `review` | Java/Spring Boot |
| `/python-dev` | `new` `debug` `fastapi` `django` `test` `review` | Python/FastAPI/Django |
| `/go-dev` | `new` `debug` `api` `test` `profile` `review` | Go/Gin/Echo |
| `/rust-dev` | `new` `debug` `api` `test` `review` `unsafe-audit` | Rust/Axum/Actix |
| `/frontend` | `component` `page` `state` `test` `a11y` `perf` `review` | React/Vue/Svelte/Angular |
| `/test` | `generate` `e2e` `integration` `coverage` `flaky` `strategy` `setup` | Test orchestrator — routes to specialists |
| `/test-backend` | `unit` `integration` `db` `queue` `worker` `contract` `fixture` | Backend test automation |
| `/test-frontend` | `component` `e2e` `visual` `a11y` `hook` `integration` `snapshot` | Frontend test automation |
| `/test-api` | `rest` `graphql` `contract` `schema` `load` `mock` `smoke` | API test automation |
| `/api` | `design` `breaking` `validate` `mock` `client` `docs` | API design & clients |
| `/auth` | `flow` `jwt` `rbac` `oauth` `review` `session` | Auth & authorization |
| `/perf` | `profile` `cache` `bundle` `query` `vitals` `benchmark` | Performance |
| `/data-model` | `design` `migrate` `review` `seed` `query` | Data modeling |
| `/monorepo` | `setup` `deps` `build` `shared-types` `ci` | Monorepo tooling |

### Planning & Migrations (1 skill)

| Skill | Actions | Description |
|-------|---------|-------------|
| `/migrate` | `k8s-upgrade` `cluster` `account` `service` `database` | Migration planning |

### Workflow Compositions (6 skills)

| Skill | Chains | Description |
|-------|--------|-------------|
| `/deploy-review` | infra + compliance + secrets + cost | Pre-deployment gate |
| `/onboard-cluster` | nodes + workloads + helm + capacity | Map a K8s cluster |
| `/pre-merge` | code review + security + secrets | Pre-merge gate |
| `/service-review` | code + tests + perf + security + API | Service quality gate |
| `/feature-check` | tests + lint + types + build | Pre-push validation |
| `/tech-debt` | deps + code quality + coverage + perf | Debt assessment |

### Scaffolding & General Development (7 skills)

| Skill | Description |
|-------|-------------|
| `/scaffold` | Generate terraform-module, helm-chart, github-actions, service scaffolds |
| `/commit` | Smart commits with conventional messages |
| `/pr-review` | Pull request review |
| `/deep-research` | Thorough codebase research |
| `/code-audit` | Security and quality audit |
| `/doc-gen` | Generate documentation |
| `/refactor` | Refactor with safety checks |

---

## Agents Reference

### DevOps & Infrastructure (14 agents)

| Agent | Model | What It Does |
|-------|-------|-------------|
| **sre** | Sonnet | Incident investigation, SLO review, monitoring gaps |
| **terraform-reviewer** | Sonnet | Terraform security, cost, reliability review |
| **k8s-ops** | Sonnet | Cluster health, pod debugging, manifest review |
| **kops-manager** | Sonnet | Kops operations, upgrades, instance groups |
| **helm-ops** | Sonnet | Release debugging, chart review, values diff |
| **cloud-architect** | Opus | AWS architecture design, trade-off analysis |
| **iam-analyzer** | Sonnet | Permission tracing, least-privilege, IRSA |
| **compliance-checker** | Sonnet | CIS/SOC2/PCI audits with remediation |
| **capacity-planner** | Sonnet | Right-sizing, node pools, RI planning |
| **secrets-auditor** | Sonnet | Secret detection, rotation audit |
| **observability-ops** | Sonnet | Prometheus, Grafana, CloudWatch, SLOs |
| **db-ops** | Sonnet | Query optimization, RDS/DynamoDB/Redis |
| **container-security** | Sonnet | Dockerfile, image scanning, supply chain |
| **dependency-checker** | Sonnet | Vulnerability scanning, license compliance |

### Networking & Debugging (5 agents)

| Agent | Model | What It Does |
|-------|-------|-------------|
| **network-debugger** | Sonnet | DNS → K8s → SGs → NACLs → routes → LBs |
| **log-analyzer** | Sonnet | Cross-service log correlation, timelines |
| **yaml-surgeon** | Sonnet | Schema-aware YAML validation |
| **pipeline-ops** | Sonnet | CI/CD debugging (GH Actions, ArgoCD, Jenkins) |
| **migration-planner** | Opus | Phased migration plans with rollback |

### Application Development (14 agents)

| Agent | Model | What It Does |
|-------|-------|-------------|
| **java-expert** | Sonnet | Spring Boot, Maven/Gradle, JPA, concurrency, GC |
| **python-dev** | Sonnet | FastAPI, Django, SQLAlchemy, async, packaging |
| **go-dev** | Sonnet | Gin/Echo, GORM, goroutines, modules, pprof |
| **rust-dev** | Sonnet | Axum/Actix, Tokio, ownership, unsafe review |
| **frontend-dev** | Sonnet | React, Vue, Next.js, Svelte, Angular, CSS, a11y |
| **qa-engineer** | Sonnet | QA orchestrator — delegates to test specialists |
| **backend-test-engineer** | Sonnet | Unit, DB, queue, worker, contract test automation |
| **frontend-test-engineer** | Sonnet | Component, E2E, visual regression, a11y testing |
| **api-test-engineer** | Sonnet | REST, GraphQL, contract, load test, mock servers |
| **api-designer** | Sonnet | REST, GraphQL, gRPC, OpenAPI, contracts |
| **auth-specialist** | Sonnet | OAuth2, JWT, RBAC, OIDC, session management |
| **perf-optimizer** | Sonnet | Profiling, caching, query tuning, Core Web Vitals |
| **data-modeler** | Sonnet | Schema design, migrations, ORM patterns |
| **fullstack-ops** | Sonnet | Monorepo, API client gen, shared types, dev env |

### General Development (4 agents)

| Agent | Model | What It Does |
|-------|-------|-------------|
| **code-reviewer** | Sonnet | Code quality, security, performance review |
| **debugger** | Sonnet | Test failure diagnosis, root cause analysis |
| **architect** | Opus | System architecture, trade-offs, strategy |
| **researcher** | Sonnet | Deep codebase exploration, technical research |

---

## Rules Reference

### Infrastructure Rules (8)

| Rule | Applies To |
|------|-----------|
| **terraform.md** | `*.tf` |
| **kubernetes.md** | K8s manifests |
| **kops.md** | Kops configs |
| **aws.md** | AWS infrastructure |
| **docker.md** | Dockerfiles |
| **cicd.md** | Workflows/pipelines |
| **helm-charts.md** | Chart.yaml, values.yaml |
| **monitoring.md** | Alert rules, dashboards |

### Language Rules (7)

| Rule | Applies To | Key Focus |
|------|-----------|-----------|
| **python.md** | `*.py` | Type hints, ruff, pathlib, logging |
| **golang.md** | `*.go` | Error wrapping, interfaces, context, table tests |
| **typescript.md** | `*.ts`, `*.tsx` | Strict mode, no `any`, discriminated unions |
| **java.md** | `*.java` | Optional, records, constructor injection, SLF4J |
| **rust.md** | `*.rs` | Result, thiserror/anyhow, borrowing, clippy |
| **react.md** | `*.tsx`, `*.jsx` | Hooks rules, server components, composition |
| **vue.md** | `*.vue` | Composition API, `<script setup>`, Pinia |

### Framework Rules (3)

| Rule | Applies To | Key Focus |
|------|-----------|-----------|
| **spring-boot.md** | Spring Boot files | Layered arch, `@ControllerAdvice`, profiles |
| **fastapi.md** | FastAPI routes | Pydantic models, `Depends()`, async |
| **django.md** | Django files | Fat models, select_related, managers |

### Cross-Cutting Rules (11)

| Rule | Applies To | Key Focus |
|------|-----------|-----------|
| **code-style.md** | All code | Naming, function size, imports |
| **testing.md** | All tests | Behavior testing, AAA, edge cases |
| **testing-patterns.md** | Test files | Factories, no sleep, mock at boundaries |
| **backend-testing.md** | Backend test files | TestContainers, mocking, contract tests, queues |
| **frontend-testing.md** | Frontend test files | Role selectors, Playwright, visual reg, a11y |
| **api-testing.md** | API test files | REST endpoints, GraphQL, Pact, schema validation |
| **security.md** | All files | No secrets, input validation, HTTPS |
| **git.md** | Git operations | Conventional commits, atomic changes |
| **api-conventions.md** | Route/handler files | REST semantics, error format, pagination |
| **state-management.md** | Store files | Server vs client state, normalization |
| **accessibility.md** | UI components | Semantic HTML, ARIA, keyboard, contrast |

---

## Hooks

### Pre-Commit Secret Scanner
```bash
ln -s $(pwd)/.claude/hooks/pre-commit-secrets.sh .git/hooks/pre-commit
```
Detects AWS keys, private keys, passwords, tokens, JWTs before commit.

### Post-Edit Hook
Runs after Write/Edit. Customize per project for auto-formatting/linting.

---

## Project Structure

```
.claude/
├── settings.json              # Permissions, hooks, project config
├── skills/                    # 52 slash commands
├── agents/                    # 37 specialized agents
├── rules/                     # 29 context-specific rule files
└── hooks/                     # Lifecycle hook scripts
```

## Extending

### Add a Skill
```bash
mkdir .claude/skills/my-skill && cat > .claude/skills/my-skill/SKILL.md << 'EOF'
---
name: my-skill
description: What this skill does
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "<action> <target>"
---
# My Skill
Instructions...
EOF
```

### Add an Agent
```bash
mkdir .claude/agents/my-agent && cat > .claude/agents/my-agent/agent.md << 'EOF'
---
name: my-agent
description: What this agent does
tools: Read, Grep, Glob, Bash
model: sonnet
maxTurns: 25
---
Instructions...
EOF
```

### Add a Rule
```bash
cat > .claude/rules/my-rule.md << 'EOF'
---
description: When this rule applies
paths: ["**/*.ext"]
---
# My Rule
Conventions...
EOF
```

## License

Personal use. Fork and adapt to your own workflows.
