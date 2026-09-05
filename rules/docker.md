# Containers

Optional inspection notes for [AgentReady](../skills/agentready/SKILL.md). Use the project's actual configuration; this file does not grant permissions or prescribe a stack.

Start with Dockerfiles, Compose files, and `.dockerignore`.

- Identify build targets, runtime users, mounted volumes, exposed ports, and service dependencies.
- Use the project's documented Compose commands and inspect which resources they affect.
- Record image versions and required runtime privileges; investigate unnecessary access when relevant to the task.
- Keep secrets out of image layers and committed configuration.
- Removing volumes can delete data. Follow the user's authorization before destructive operations.
