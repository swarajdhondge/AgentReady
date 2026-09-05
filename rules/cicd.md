# CI and deployment

Optional inspection notes for [AgentReady](../skills/agentready/SKILL.md). Use the project's actual configuration; this file does not grant permissions or prescribe a stack.

Start with Workflow files, deployment scripts, and release documentation.

- Identify triggers, required checks, artifacts, environments, and deployment gates.
- Read which credentials and permissions each job uses without exposing secret values.
- Preserve the project's release and rollback procedure. Do not infer deployment or merge approval from permission to edit a workflow.
- Inspect commands before running them locally; CI scripts may publish artifacts or provision resources.
- Verify affected jobs with available checks and report any execution that remains untested.
