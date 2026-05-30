# CI/CD Rules

## Signals
`.github/workflows/*.yml`, `Jenkinsfile`, `.gitlab-ci.yml`, `cloudbuild.yaml`, `Makefile` with deploy targets

## CLAUDE.md sections to include

### Conventions (GitHub Actions)
- Pin action versions to full SHA, not tags (supply chain security)
- Use `GITHUB_TOKEN` built-in, not PATs, where possible
- Cache dependencies (actions/cache) to speed up builds
- Separate jobs for lint, test, build, deploy -- fail fast
- Branch protection: require PR reviews + passing checks before merge

### Conventions (General)
- Build once, deploy many: same artifact across environments
- Secrets via CI platform's secret store, never in code
- Idempotent deployments: running deploy twice should be safe
- Rollback plan documented for every deploy pipeline

### Prohibitions
- NEVER store secrets in workflow files
- NEVER use `actions/checkout` without specifying the ref (for PRs)
- NEVER auto-merge without tests passing

## Permissions
```
Bash(gh run list:*), Bash(gh run view:*), Bash(gh pr:*)
```
