# Context & Session Management Rules

## CLAUDE.md Size Enforcement

CLAUDE.md MUST stay under 100 lines. This is the single most impactful file in any project.

- Under 100 lines: ~95% compliance with rules
- 100-150 lines: ~70% compliance
- 150-200 lines: ~50% compliance
- Over 200 lines: rules at the bottom get ignored entirely

If CLAUDE.md exceeds 100 lines, restructure immediately:
- Core file: overview, tech stack, commands, top conventions, critical prohibitions
- Move details to `@imported` files: `@docs/architecture.md`, `@docs/deployment.md`
- Move per-directory rules to `.claude/rules/*.md` with `paths:` frontmatter for lazy-loading

## Tool Budget

Keep total active tools under 40-50 across all MCP servers. Beyond this threshold:
- Model starts picking wrong tools
- 30-40% of context consumed by tool schemas that are never used
- Response quality degrades

Practical limit: 3-6 MCP servers active at once. Never exceed 10.

## Session Hygiene

- Start each session by reading CLAUDE.md
- `/clear` between unrelated tasks
- `/compact <focus>` when context approaches 40%
- Don't start complex work at 50%+ context usage
- Use subagents for exploration-heavy work to preserve main context
- After compaction: re-read CLAUDE.md and any active plan

## Memory vs Context

- Memory files (MEMORY.md, memory/*.md): persist across sessions. Use for things future sessions need.
- CLAUDE.md: loaded every session. Use for rules, conventions, commands.
- Context (conversation): ephemeral. Don't rely on it surviving compaction.
- Plans (plan.md): ephemeral but important. Re-read after compaction.
