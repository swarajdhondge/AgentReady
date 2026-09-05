# AgentReady

Read [the AgentReady skill](skills/agentready/SKILL.md), then follow the references needed for the user's request. Work in the user's project, not this source repository.

## Reading hosted files

A checkout or installation is not required. When reading this file over HTTP, resolve relative links from this file's URL. Fetch the skill and its needed references/assets from the same branch or revision. On GitHub's HTML view, use its raw-file view to read Markdown. Do not run downloaded scripts or clone the repository for setup.

If a required file cannot be fetched, report the exact missing URL and ask for its contents or an accessible source. Do not guess the workflow or claim setup succeeded.

## Setup scope

- “Set up this project”: inspect it and merge the project template into its existing `AGENTS.md`, preserving content and conventions.
- “Set up globally”: inspect the host's personal instruction location and merge the global template there. Do not change every repository or put project state in the global file.
- A goal included in the request: follow the skill's discovery and execution guidance within the user's authorization.

Templates and merge rules are linked from the skill's adapter reference. Report the files changed and any unavailable capabilities. Native slash commands require host installation; this hosted prompt does not register one.
