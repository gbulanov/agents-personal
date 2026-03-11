# Personal Agent Agency

A collection of reusable Claude Code agents and skills for DevOps, SRE, cloud engineering,
application development, and software engineering workflows.

## What This Repo Is

This is a personal library of Claude Code extensions — agents that handle specialized tasks
and skills (slash commands) that encode repeatable workflows. Clone or symlink into any
project to get a ready-made AI-powered development toolkit.

## How to Use

### Skills (slash commands)
Skills are invoked with `/<skill-name>` in Claude Code:

**DevOps & Infrastructure:**
- `/terraform <plan|validate|fmt|new-module|import|migrate|debug>` — Terraform operations
- `/k8s <manifest|debug|review|status|rollback|scale|logs>` — Kubernetes operations
- `/kops <status|get|create|edit|update|upgrade|rolling-update|ig|drain|certs|etcd|addons|debug|export|delete>` — Kops cluster lifecycle
- `/helm <status|diff|template|lint|debug|history|deps>` — Helm operations
- `/aws <query|debug|iam|sg|logs|costs|whoami>` — AWS operations
- `/iam <analyze|policy|role|audit|irsa>` — IAM analysis
- `/incident <investigate|mitigate|postmortem|runbook>` — Incident response
- `/infra-review` — IaC security and reliability review
- `/cost-review` — Cost optimization analysis
- `/compliance <cis-aws|cis-k8s|soc2|pci|all>` — Compliance audits
- `/capacity <analyze|rightsize|forecast|nodes>` — Capacity planning
- `/secrets <scan|audit|rotation|review>` — Secret management audit
- `/monitor <alerts|slo|dashboards|cloudwatch|review>` — Monitoring and observability
- `/db <review|optimize|health|migration|connections>` — Database operations
- `/docker <review|scan|harden|compose>` — Container security
- `/deps <audit|outdated|licenses|upgrade-plan>` — Dependency management
- `/dns <query|debug|audit|records>` — DNS operations
- `/dr <audit|plan|runbook|test>` — Disaster recovery

**Networking & Debugging:**
- `/network-debug <source> cannot reach <target>` — Network diagnosis
- `/logs <k8s|cloudwatch|file|system> <target>` — Log analysis
- `/yaml <validate|fix|diff|convert|merge> <file>` — YAML operations
- `/pipeline <debug|review|create|status>` — CI/CD pipeline operations
- `/loadtest <generate|analyze|plan>` — Load testing
- `/api-review <review|breaking|validate|design>` — API design review

**Application Development:**
- `/java <new|debug|spring|build|migrate|review>` — Java/Spring Boot development
- `/python-dev <new|debug|fastapi|django|test|review>` — Python development
- `/go-dev <new|debug|api|test|profile|review>` — Go development
- `/rust-dev <new|debug|api|test|review|unsafe-audit>` — Rust development
- `/frontend <component|page|state|test|a11y|perf|review>` — Frontend development (React/Vue/Svelte/Angular)
- `/test <generate|e2e|integration|coverage|flaky|strategy|setup>` — Test orchestrator and QA
- `/test-backend <unit|integration|db|queue|worker|contract|fixture>` — Backend test automation
- `/test-frontend <component|e2e|visual|a11y|hook|integration|snapshot>` — Frontend test automation
- `/test-api <rest|graphql|contract|schema|load|mock|smoke>` — API test automation
- `/api <design|breaking|validate|mock|client|docs>` — API design and client generation
- `/auth <flow|jwt|rbac|oauth|review|session>` — Authentication and authorization
- `/perf <profile|cache|bundle|query|vitals|benchmark>` — Performance analysis
- `/data-model <design|migrate|review|seed|query>` — Data modeling
- `/monorepo <setup|deps|build|shared-types|ci>` — Monorepo management

**Planning & Migration:**
- `/migrate <k8s-upgrade|cluster|account|service|database>` — Migration planning

**Workflow Compositions:**
- `/deploy-review` — Pre-deployment gate (infra + compliance + secrets + cost)
- `/onboard-cluster` — Map an unfamiliar K8s cluster
- `/pre-merge` — Pre-merge quality gate (code review + security + secrets)
- `/service-review` — Full service quality gate (code + tests + perf + security + API)
- `/feature-check` — Pre-push validation (tests + lint + type-check + build)
- `/tech-debt` — Technical debt assessment

**Scaffolding:**
- `/scaffold <terraform-module|helm-chart|github-actions|service>` — Project scaffolds

**General Development:**
- `/commit` — Smart commits with conventional commit messages
- `/pr-review` — Review a pull request for quality and issues
- `/deep-research` — Thorough codebase or topic research
- `/code-audit` — Security and quality audit
- `/doc-gen` — Generate documentation for code
- `/refactor` — Refactor code with safety checks

### Agents (subagents)
Agents are specialized assistants that Claude delegates to automatically:

**DevOps & Infrastructure:**
- **sre** — Incident investigation, reliability assessment, monitoring review
- **terraform-reviewer** — Terraform code review
- **k8s-ops** — Cluster health, pod debugging, manifest review
- **kops-manager** — Kops cluster operations
- **helm-ops** — Helm release debugging, chart review
- **cloud-architect** — AWS architecture design, trade-off analysis
- **iam-analyzer** — IAM permission tracing, IRSA review
- **compliance-checker** — CIS, SOC2, PCI audits
- **capacity-planner** — Resource right-sizing, forecasting
- **secrets-auditor** — Secret leak detection, rotation audit
- **observability-ops** — Prometheus rules, Grafana, SLO design
- **db-ops** — Query optimization, RDS/DynamoDB/Redis
- **container-security** — Dockerfile review, image scanning
- **dependency-checker** — Vulnerability scanning, license compliance

**Networking & Debugging:**
- **network-debugger** — DNS, SGs, NACLs, VPC routing
- **log-analyzer** — Error pattern detection, cross-service correlation
- **yaml-surgeon** — YAML validation, schema awareness
- **pipeline-ops** — CI/CD debugging
- **migration-planner** — Phased migration plans

**Application Development:**
- **java-expert** — Java/JVM, Spring Boot, Maven/Gradle, JPA
- **python-dev** — Python, FastAPI, Django, SQLAlchemy, async
- **go-dev** — Go, Gin/Echo, GORM, goroutines, modules
- **rust-dev** — Rust, Axum/Actix, Tokio, ownership, unsafe review
- **frontend-dev** — React, Vue, Next.js, Svelte, Angular, CSS
- **qa-engineer** — QA orchestrator, delegates to backend/frontend/api test engineers
- **backend-test-engineer** — Backend test automation (unit, DB, queue, contract tests)
- **frontend-test-engineer** — Frontend test automation (component, E2E, visual, a11y)
- **api-test-engineer** — API test automation (REST, GraphQL, contract, load, mock)
- **api-designer** — REST, GraphQL, gRPC, OpenAPI, contracts
- **auth-specialist** — OAuth2, JWT, RBAC, session management
- **perf-optimizer** — Profiling, caching, query optimization
- **data-modeler** — Schema design, migrations, ORM patterns
- **fullstack-ops** — Monorepo, API client generation, shared types

**General Development:**
- **code-reviewer** — Code quality, security, best practices review
- **debugger** — Test failure and runtime error diagnosis
- **architect** — System architecture and trade-offs
- **researcher** — Deep codebase and technical research

## Project Structure
```
.claude/
├── settings.json          # Shared project settings
├── skills/                # 52 slash commands
├── agents/                # 37 specialized agents
├── rules/                 # 29 context-specific coding rules
└── hooks/                 # Lifecycle hook scripts
```

## Adding New Skills

Create a directory under `.claude/skills/<name>/` with a `SKILL.md` file.
See existing skills for the frontmatter format.

## Adding New Agents

Create a directory under `.claude/agents/<name>/` with an `agent.md` file.
See existing agents for the configuration format.
