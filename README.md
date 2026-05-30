# AgentReady

Most AI coding agents work better when your project has the right instruction files, permissions, and conventions set up. Setting that up manually is tedious and easy to get wrong.

AgentReady does it for you. One prompt, and your agent scans your project, figures out what tech you're using, and writes the config it needs to work well — without touching anything you've already set up.

Works with Claude Code, Codex, Gemini CLI, Cursor, Copilot.

## Usage

In your project, tell your AI agent:

```
Use https://github.com/SwarajDhondge/AgentReady to set up this project
```

It reads [`ENV.md`](ENV.md), scans your project, and generates what's missing. Never overwrites existing config.

## What's in the repo

- [`ENV.md`](ENV.md) — The playbook the agent executes
- [`rules/`](rules/) — Composable per-tech rules (Python, TypeScript, React/Next.js, Docker, Terraform, .NET, ML/AI, CI/CD)
- [`global/`](global/) — Agents, hooks, and commands copied into your project

## How it works

Your agent reads the playbook, scans your project for stack signals like `package.json`, `pyproject.toml`, `Dockerfile`, or `*.tf`, and loads only the rules that match. It then checks what config you already have, diffs it against the rules, and fills in the gaps — agent instructions, permissions, reviewer agents, slash commands. If something's already there, it leaves it alone.

## License

MIT
