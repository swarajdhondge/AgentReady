# Docker / Container Rules

## Signals
`Dockerfile`, `docker-compose.yml`, `docker-compose.yaml`, `.dockerignore`

## CLAUDE.md sections to include

### Commands
```bash
docker compose build
docker compose up -d
docker compose ps
docker compose logs -f <service>
docker compose down
```

### Conventions
- Multi-stage builds: separate build and runtime stages
- Non-root user in production containers
- Minimal base images (alpine, distroless, slim)
- .dockerignore mirrors .gitignore + node_modules, .git, __pycache__
- Pin image versions (no `latest` tag in production)
- One process per container

### Security
- Read-only root filesystem where possible (`read_only: true`)
- Drop all capabilities, add back only what's needed (`cap_drop: [ALL]`)
- No new privileges (`security_opt: [no-new-privileges:true]`)
- Resource limits on all services (memory, CPU)
- Seccomp profiles for production containers
- Never run as root in production

### Prohibitions
- NEVER hardcode secrets in Dockerfile or compose -- use env_file or secrets
- NEVER expose unnecessary ports
- NEVER use `docker compose down -v` without confirmation (destroys volumes)

## Permissions
```
Bash(docker compose ps:*), Bash(docker compose logs:*), Bash(docker compose build:*), Bash(docker compose up:*), Bash(docker compose down)
```

## Deny
```
Bash(docker compose down -v:*)
```
