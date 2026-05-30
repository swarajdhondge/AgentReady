# Autonomous Workflow Rules

These patterns apply to EVERY project regardless of tech stack.

## The Workflow: Research → Plan → Execute → Review → Ship

### 1. Research (use subagents)
- Spawn read-only subagents to explore the codebase
- This keeps the main context clean for actual work
- Never read 20+ files in main context -- delegate to a subagent and get a summary

### 2. Plan (before writing code)
- For non-trivial tasks (touching 3+ files): state your plan BEFORE coding
- List: what files change, what the expected behavior is, how to verify
- If the plan has ambiguity, resolve it before writing code

### 3. Execute (branch first)
- Always create a feature branch before making changes
- Dispatch subagents for independent side tasks (tests, docs, linting)
- Let the agent iterate on failures -- don't declare done on first attempt

### 4. Review (fresh context)
- Use a code-reviewer subagent with read-only tools on the diff
- Fresh context avoids bias from code the same agent wrote
- Check: logic errors, edge cases, security, performance

### 5. Ship
- Run the full test suite
- Create PR with description of what changed and why
- Use GitHub MCP or `gh` CLI

## The Verification Loop

This is the single most impactful pattern for autonomous work:

> Give the agent runnable checks (tests, build, lint, browser automation).
> Say "run it and fix anything that fails."
> The agent iterates until all checks pass.

Every project MUST have at least one runnable verification command in CLAUDE.md.
If the project has no tests, the first task should be adding them.

## Context Management

This is the #1 failure mode for long sessions. Follow these thresholds:

| Context Usage | Action |
|--------------|--------|
| 0-40% | Work freely |
| 40-60% | Run `/compact <focus area>` proactively |
| 60%+ | Wrap up current task, `/clear`, start fresh |

Rules:
- Manual `/compact <hint>` is better than auto-compact (auto fires too late)
- Push exploration to subagents -- each one uses its own context window
- Use `/clear` between unrelated tasks
- Never start a big task at 50%+ context -- compact or clear first
- After compaction, re-read CLAUDE.md and any active plan

## Subagent Model Routing

Use the cheapest model that gets the job done:

| Task | Model | Why |
|------|-------|-----|
| File exploration, grep, search | Haiku | 5-10x cheaper, fast |
| Code review, test writing, focused edits | Sonnet | Good balance of speed and quality |
| Architecture decisions, complex debugging, orchestration | Opus | Most capable, use for hard problems |

## Parallel Agents

- Run 3-5 independent sessions using worktrees for parallelism
- Each session works on a genuinely independent task
- More than 5 parallel sessions: review overhead outweighs parallelism
- Running 4 parallel agents improves success rate from 25% to 68% for complex tasks
