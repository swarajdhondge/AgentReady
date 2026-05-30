# Example: AgentReady on a fresh Python API

## Project: FastAPI + PostgreSQL, brand new, no existing agent config

### Step 1: Read existing state
- No CLAUDE.md, AGENTS.md, or CODEX.md
- No .claude/ directory
- No .mcp.json
- README.md exists (basic project description)
- No existing agents, skills, or commands

### Step 2: Detect
Python (FastAPI, SQLAlchemy, Pydantic, Alembic, pytest), Docker (compose with postgres service)

### Step 3: Rules loaded
python.md, docker.md, workflow.md, context.md

### Step 4: Diff
- No instruction file exists -- need to create one
- No permissions -- need full setup
- No agents, skills, or commands

### Step 5: Create AGENTS.md (45 lines)

New file since nothing existed. Includes:
- Project overview (from README.md)
- Tech stack: FastAPI, SQLAlchemy, PostgreSQL, Alembic
- Commands: `pytest -x --tb=short`, `ruff check . && ruff format .`, `docker compose up -d`, `alembic upgrade head`
- Conventions: type hints, async routes, Pydantic v2 models, parameterized SQL
- Prohibitions: no hardcoded secrets, no string SQL interpolation, no .env commits
- Workflow section (automatic agents)

45 lines total -- well under 100, no restructuring needed.

### Step 6-7: MCP + permissions
No .mcp.json needed (global servers cover it)
Created `.claude/settings.json` with: pytest, ruff, pip, alembic, docker compose, uvicorn permissions

### Step 8-10: Skills, agents, commands
Installed skills: grill-me, grill-with-docs (via `--skill` flag)
Copied: code-reviewer.md, security-reviewer.md, test-writer.md
Copied: /ready command

### Report
```
## AgentReady Applied

### Detected: Python (FastAPI), Docker
### Rules loaded: python, docker, workflow, context
### Agent: Claude Code

### Created:
- AGENTS.md (45 lines)
- .claude/settings.json
- .claude/agents/code-reviewer.md, security-reviewer.md, test-writer.md
- .claude/commands/ready.md

### Skills installed: grill-me, grill-with-docs

### Already in place: README.md, pytest config, Docker setup

### Needs user action: none
```
