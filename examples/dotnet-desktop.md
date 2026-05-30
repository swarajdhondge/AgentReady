# Example: AgentReady on a .NET desktop app

## Project: WPF app with SQLite, no web, no Docker

### Step 1: Read existing state
- No CLAUDE.md or AGENTS.md
- No .claude/ directory
- README.md exists
- Solution file: MyApp.sln, two projects: MyApp.csproj, MyApp.Tests.csproj

### Step 2: Detect
.NET (WPF, Entity Framework Core, SQLite, xUnit)

### Step 3: Rules loaded
dotnet.md, workflow.md, context.md

### Step 4: Diff
- No instruction file -- need to create
- No permissions
- No agents or commands
- No Docker, no CI/CD, no frontend web -- skip those rules entirely

### Step 5: Create AGENTS.md (38 lines)

Lean file for a focused project:
- Project overview: WPF desktop app with MVVM
- Tech stack: .NET 8, WPF, EF Core, SQLite
- Commands: `dotnet build`, `dotnet test`, `dotnet format`, `dotnet run --project MyApp`
- Conventions: MVVM pattern, async I/O, INotifyPropertyChanged, DI container
- Prohibitions: no UI thread blocking, no Thread.Sleep in UI, no committed connection strings
- Workflow section (automatic agents)

38 lines -- no restructuring needed.

### Step 6-7: MCP + permissions
No .mcp.json needed
Created `.claude/settings.json` with: dotnet build, test, format, run permissions. Denied: dotnet publish

### Step 8-10: Skills, agents, commands
Installed skills: grill-me, grill-with-docs (via `--skill` flag)
No webapp-testing or frontend-design -- not a web project
Copied: code-reviewer.md, test-writer.md, docs-maintainer.md
Skipped: security-reviewer.md (no auth, no cloud infra, no user data handling)
Copied: /ready command

### Report
```
## AgentReady Applied

### Detected: .NET (WPF, EF Core, xUnit)
### Rules loaded: dotnet, workflow, context
### Agent: Claude Code

### Created:
- AGENTS.md (38 lines)
- .claude/settings.json
- .claude/agents/code-reviewer.md, test-writer.md, docs-maintainer.md
- .claude/commands/ready.md

### Skills installed: grill-me, grill-with-docs

### Already in place: README.md, test project

### Needs user action: none
```
