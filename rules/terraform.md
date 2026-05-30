# Terraform / IaC Rules

## Signals
`*.tf`, `terraform/` directory, `.terraform.lock.hcl`, `terragrunt.hcl`

## CLAUDE.md sections to include

### Commands
```bash
terraform init
terraform plan -out=tfplan
terraform apply tfplan
terraform fmt -recursive
terraform validate
```

### Conventions
- One resource type per file (vpc.tf, subnets.tf, security_groups.tf)
- variables.tf + outputs.tf in every module
- Use modules for reusable infrastructure
- Remote state backend (S3, GCS, etc.) -- never local state in team projects
- Tag all resources: project, environment, owner, managed-by=terraform
- Use data sources to reference existing resources, don't hardcode IDs

### Security
- Read-only IAM roles for CI, write roles only for deploy
- Encrypt state files at rest
- Use SOPS or Vault for secrets, never plaintext in tfvars
- Principle of least privilege for all IAM policies
- Enable logging/auditing on all cloud resources

### Prohibitions
- NEVER run `terraform destroy` without explicit human confirmation
- NEVER commit .tfstate or .tfvars with secrets
- NEVER use `terraform apply -auto-approve` in production
- Always `terraform plan` before `terraform apply`

## Permissions
```
Bash(terraform fmt:*), Bash(terraform validate:*), Bash(terraform plan:*)
```

## Deny
```
Bash(terraform destroy:*), Bash(terraform apply -auto-approve:*), Read(**/*.tfstate*)
```

## If Helm detected alongside
- Add: `Bash(helm lint:*), Bash(helm template:*)` to permissions
- Deny: `Bash(kubectl delete:*)`
- Convention: dry-run before apply
