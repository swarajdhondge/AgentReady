# Example: AgentReady re-run on an already-configured project

## Project: Node.js API, AgentReady applied 2 weeks ago, running again to verify

### Step 1: Read existing state
- CLAUDE.md exists (72 lines) -- was created by AgentReady previously
- .claude/settings.json exists -- has permissions from last run
- .claude/agents/ has: code-reviewer.md, test-writer.md
- .claude/commands/ready.md exists
- .agents/skills/ has: grill-me
- Workflow section present in CLAUDE.md

### Step 2: Detect
TypeScript (Express, Prisma, Jest), Docker (compose with postgres), GitHub Actions (test workflow)

### Step 3: Rules loaded
typescript.md, docker.md, cicd.md, workflow.md, context.md

### Step 4: Diff
- CLAUDE.md is 72 lines -- under limit, no restructuring needed
- Since last run, user added Prisma to the project -- prisma-specific conventions missing
- Missing: `npx prisma generate`, `npx prisma migrate dev` in commands
- Missing: docker compose permissions for new redis service added to compose
- Agents: code-reviewer and test-writer present, docs-maintainer missing (docs/ was added)
- Skills: grill-me installed, grill-with-docs not installed (docs/ now exists)
- /ready command already present

### Step 5: Update CLAUDE.md (72 → 78 lines)
Added:
- Prisma commands: `npx prisma generate`, `npx prisma migrate dev`
- Convention: use Prisma Client for all DB access, never raw SQL
- Convention: migrations via `prisma migrate`, never manual schema changes

Everything else left untouched -- existing content preserved.

### Step 6-7: MCP + permissions
No .mcp.json changes needed
Updated `.claude/settings.json`: added `Bash(npx prisma:*)`, `Bash(docker compose:*)`

### Step 8-10: Skills, agents, commands
Installed skills: grill-with-docs (docs/ now exists, wasn't there before)
Skipped: grill-me (already installed)
Skipped: webapp-testing, frontend-design (no react/next)
Copied: docs-maintainer.md (docs/ was added since last run)
Skipped: code-reviewer.md, test-writer.md (already present, not overwritten)
Skipped: /ready command (already present)

### Report
```
## AgentReady Applied (re-run)

### Detected: TypeScript (Express, Prisma), Docker, GitHub Actions
### Rules loaded: typescript, docker, cicd, workflow, context
### Agent: Claude Code

### Created:
- .claude/agents/docs-maintainer.md

### Updated:
- CLAUDE.md (72 → 78 lines, added Prisma conventions)
- .claude/settings.json (added prisma + docker compose permissions)

### Skills installed: grill-with-docs

### Already in place:
- CLAUDE.md structure, workflow section, existing conventions
- code-reviewer.md, test-writer.md agents
- grill-me skill
- /ready command
- MCP servers (global)

### Needs user action: none
```
