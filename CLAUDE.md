# Personal Agent Agency

A collection of reusable Claude Code agents and skills for software engineering workflows.

## What This Repo Is

This is a personal library of Claude Code extensions — agents that handle specialized tasks
and skills (slash commands) that encode repeatable workflows. Clone or symlink into any
project to get a ready-made AI-powered development toolkit.

## How to Use

### Skills (slash commands)
Skills are invoked with `/<skill-name>` in Claude Code:
- `/commit` — Smart commits with conventional commit messages
- `/pr-review` — Review a pull request for quality and issues
- `/deep-research` — Thorough codebase or topic research
- `/code-audit` — Security and quality audit
- `/doc-gen` — Generate documentation for code
- `/refactor` — Refactor code with safety checks

### Agents (subagents)
Agents are specialized assistants that Claude delegates to automatically:
- **code-reviewer** — Reviews code changes for quality, security, and best practices
- **debugger** — Diagnoses test failures and runtime errors
- **architect** — Designs system architecture and evaluates trade-offs
- **researcher** — Deep dives into codebases and technical topics

## Project Structure
```
.claude/
├── settings.json          # Shared project settings
├── skills/                # Slash command definitions
│   ├── commit/            # /commit
│   ├── pr-review/         # /pr-review
│   ├── deep-research/     # /deep-research
│   ├── code-audit/        # /code-audit
│   ├── doc-gen/           # /doc-gen
│   └── refactor/          # /refactor
├── agents/                # Subagent definitions
│   ├── code-reviewer/
│   ├── debugger/
│   ├── architect/
│   └── researcher/
├── rules/                 # Context-specific coding rules
└── hooks/                 # Lifecycle hook scripts
```

## Adding New Skills

Create a directory under `.claude/skills/<name>/` with a `SKILL.md` file.
See existing skills for the frontmatter format.

## Adding New Agents

Create a directory under `.claude/agents/<name>/` with an `agent.md` file.
See existing agents for the configuration format.
