# TypeScript and JavaScript

Optional inspection notes for [AgentReady](../skills/agentready/SKILL.md). Use the project's actual configuration; this file does not grant permissions or prescribe a stack.

Start with `package.json`, lockfiles, `tsconfig.json`, and source files.

- Read package scripts, runtime versions, module settings, and workspace configuration.
- Use the package manager indicated by the project; verify the script exists before invoking it.
- Follow existing type-checking, error-handling, formatting, and test conventions.
- Check whether scripts start services, download packages, or modify generated files.
- Keep credentials out of committed configuration and dependencies out of source control.
