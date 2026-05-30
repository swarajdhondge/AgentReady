# AgentReady -- Executable Playbook

You are an AI coding agent configuring a project for development. This playbook works with Claude Code, Codex, Gemini CLI, Cursor, or any agent that reads instruction files. Follow every step.

This project may already have working configuration. **Augment, not replace.** Never delete or lose existing information.

**Locating AgentReady files**: All paths (rules/, global/, commands/) are relative to this file. Determine the AgentReady root path first and use it throughout.

---

## Step 1: Read Existing State

Before changing anything, read every file that exists from this list in the target project:

```
CLAUDE.md / AGENTS.md / CODEX.md    → agent instructions
.claude/ or .cursor/ or .kiro/      → settings, agents, commands, rules
.mcp.json                           → MCP servers
MEMORY.md / memory/*.md             → memory files
CONTEXT.md                          → context
docs/**/*.md                        → architecture, deployment docs
README.md                           → project description
```

**CRITICAL**: Existing project knowledge (architecture decisions, conventions, deployment quirks) overrides AgentReady rules. Rules are defaults. Project context is truth.

---

## Step 2: Detect Tech Stack

Scan the project for these signals. Read files to extract real data (versions, deps, scripts):

```
package.json          → read scripts + dependencies (check for react, next, vue, tailwindcss, etc.)
pyproject.toml        → read [project.dependencies]
requirements.txt      → libraries
*.csproj / *.sln      → .NET packages
Cargo.toml            → Rust deps
go.mod                → Go deps
Dockerfile            → container patterns
docker-compose.yml    → services
*.tf                  → Terraform
charts/ / helm/       → Kubernetes
.github/workflows/    → CI/CD
next.config.*         → Next.js
vite.config.*         → Vite
alembic.ini           → SQLAlchemy migrations
prisma/               → Prisma ORM
Makefile              → build targets
```

Note: detect frameworks from package.json `dependencies` too, not just config files. Tailwind v4 has no config file -- check deps.

---

## Step 3: Load Matching Rules

Read ALL matching rule files from the `rules/` directory:

| Detected | Load |
|----------|------|
| .py, requirements.txt, pyproject.toml | `rules/python.md` |
| .ts/.tsx/.js/.jsx, package.json | `rules/typescript.md` |
| next.config.* OR react/next in package.json deps | `rules/react-nextjs.md` |
| Dockerfile, docker-compose.yml | `rules/docker.md` |
| *.tf, terraform/ | `rules/terraform.md` |
| *.csproj, *.sln, *.cs | `rules/dotnet.md` |
| ML/AI libs in deps (torch, tensorflow, llamaindex, langchain, anthropic, openai, google-adk) | `rules/ml-ai.md` |
| .github/workflows/, Jenkinsfile, cloudbuild.yaml | `rules/cicd.md` |

**Always load (every project). These are for agent behavior, NOT for the project's instruction file:**
- `rules/workflow.md` -- internalize the autonomous workflow patterns
- `rules/context.md` -- internalize session management rules

---

## Step 4: Diff

For each matched rule, go through its sections and check:

1. **Commands**: Is each command from the rule already documented? If not, note it.
2. **Conventions**: Is each convention already covered (even if worded differently)? If not, note it.
3. **Prohibitions**: Is each prohibition already listed? If not, note it.
4. **Permissions**: Are the permissions from the rule already in settings? If not, note them.

Only note items that are genuinely missing AND relevant to this project. Skip:
- Anything already covered
- Anything that contradicts existing project decisions
- Conditional rules where the condition doesn't match (e.g. "if mypy in deps" when mypy isn't in deps)

---

## Step 5: Update Agent Instructions

The project's primary instruction file must be **under 100 lines**.

### Which file to create/update:
- If CLAUDE.md exists → update it
- If AGENTS.md exists → update it
- If none exist → create AGENTS.md (universal, works across Claude Code, Codex, Copilot, Gemini CLI)

### If over 100 lines -- restructure (zero info loss):

Move details to separate files, keep lean core:
- Architecture → `docs/architecture.md`
- Detailed conventions → `docs/conventions.md`
- Deployment/infra → `docs/deployment.md`

For Claude Code: use `@docs/file.md` import syntax.
For other agents: add "See also: docs/architecture.md" references.

### If under 100 lines or new:
Add missing items from Step 4. Use ACTUAL commands from package.json/pyproject.toml/Makefile -- never template placeholders. Read the project's real directory structure for architecture section.

workflow.md and context.md are agent behavior rules -- do NOT put them in the project instruction file. They're for you to internalize and follow, not to persist.

---

## Step 6: Configure MCP (Claude Code only)

Skip this step if the agent is not Claude Code.

Check what MCP servers the user already has (globally and per-project). Only add what's missing AND needed.

Common global servers (do NOT duplicate if already installed): github, context7, Playwright, sequential-thinking.

If the project needs a server that isn't global, add it to `.mcp.json`:

| Project needs | Add to .mcp.json |
|---------------|------------------|
| Live library docs (any project with third-party deps) | `context7`: `npx -y @upstash/context7-mcp@latest` |
| Browser testing (frontend projects) | `playwright`: `npx -y @playwright/mcp@latest --headless` |
| Database querying during dev | `postgres`: `npx -y @bytebase/dbhub --dsn "postgresql://..."` |

If all needed servers are already global, do NOT create .mcp.json.

---

## Step 7: Update Permissions (Claude Code only)

Skip for non-Claude Code agents.

Update `.claude/settings.json` with permissions from matched rules.

Permission format is always: `Bash(command:*)` for allow, same for deny. Merge into existing file. Never remove entries. Project decisions win conflicts.

Collect `allow` entries from each rule's "Permissions" section. Collect `deny` entries from prohibitions. Always include:
```
Allow: Read, Grep, Glob, Bash(git status), Bash(git diff:*), Bash(git log:*)
```

---

## Step 8: Install Skills (Claude Code only)

Skip for non-Claude Code agents. Check what's already installed first.

| Condition | Install |
|-----------|---------|
| Every project | `npx skills add obra/superpowers` |
| Has Dockerfile OR docker-compose OR cloud infra OR auth/payments logic | `npx skills add trailofbits/skills` |
| Has react or next in package.json deps | `npx skills add https://github.com/anthropics/skills --skill webapp-testing` |
| Has react or next in package.json deps | `npx skills add https://github.com/anthropics/skills --skill frontend-design` |
| Has next in package.json deps | `npx skills add https://github.com/vercel-labs/agent-skills --skill vercel-react-best-practices` |

---

## Step 9: Copy Agents (Claude Code only -- for portability)

These agents may already be installed globally. Copy them per-project only so other developers cloning this repo get them too.

Check `.claude/agents/` -- never overwrite existing files (they may be customized).

| Condition | Copy from AgentReady `global/agents/` |
|-----------|--------------------------------------|
| Every project | `code-reviewer.md` |
| Has Docker, cloud infra, auth, or handles user data | `security-reviewer.md` |
| Has pytest, vitest, jest, or xunit in deps | `test-writer.md` |
| Has README.md or docs/ | `docs-maintainer.md` |

---

## Step 10: Copy /go Command (Claude Code only -- for portability)

Copy `commands/go.md` to `.claude/commands/go.md` if not already present. Same logic as Step 9 -- ensures portability.

---

## Step 11: Suggest Additional MCP Servers

SUGGEST only. Tell the user what would help and how to install:

| Detected | Suggest | Install command |
|----------|---------|-----------------|
| PostgreSQL/MySQL/SQLite in deps, no DB server configured | Database MCP | `claude mcp add db -- npx -y @bytebase/dbhub --dsn "connection_string"` |
| Sentry in deps or config | Sentry MCP | `claude mcp add --transport http sentry https://mcp.sentry.dev/mcp` |
| Linear ticket references (LIN- prefixes, linear.app URLs) | Linear MCP | `claude mcp add --transport http linear https://mcp.linear.app/sse` |
| Very large codebase (500+ source files) | Serena semantic search | `claude mcp add serena -- uvx --from git+https://github.com/oraios/serena serena start-mcp-server` |
| Needs web research beyond docs | Brave Search | `claude mcp add brave -- npx -y @anthropic/mcp-server-brave-search` |

---

## Step 12: Report

```
## AgentReady Applied

### Detected: [technologies found]
### Rules loaded: [rule files read]
### Agent: [Claude Code / Codex / Gemini / Cursor]

### Created:
- [new files with line counts]

### Updated:
- [modified files + what was added]

### Restructured:
- [instruction file: X lines → Y lines + imported files]

### Skills installed:
- [list, or "N/A -- not Claude Code"]

### Agents copied:
- [list, or "N/A"]

### Already in place:
- [things that needed no changes]

### Suggestions:
- [MCP servers with install commands]
```

---

## Principles

1. **Read before write.** Understand current state first.
2. **Zero information loss.** Restructure moves content, never deletes.
3. **Instruction file under 100 lines.** Details in imported files.
4. **Merge, don't replace.** Project config wins conflicts.
5. **Real data only.** Commands from actual project files, never templates.
6. **Verify before done.** Run the project's test/build/lint commands.
7. **Manage context.** Compact at 40%, clear between tasks, subagents for exploration.
8. **Agent-agnostic.** Right files for whichever agent is running.
9. **Portable.** Per-project agents/commands ensure cloners get the setup too.
