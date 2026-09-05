# Infrastructure

Optional inspection notes for [AgentReady](../skills/agentready/SKILL.md). Use the project's actual configuration; this file does not grant permissions or prescribe a stack.

Start with Terraform files, lockfiles, backend configuration, and deployment documentation.

- Identify the target account, workspace, state backend, modules, and provider versions.
- Find the project's validation, plan, review, and apply procedure. Do not assume a plan is offline or credential-free.
- Review the proposed changes and spending scope before applying infrastructure changes.
- Keep state and secret values out of public records.
- Confirm authorization for destructive operations; preserve existing access restrictions.
