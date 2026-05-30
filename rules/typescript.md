# TypeScript / JavaScript Rules

## Signals
`package.json`, `tsconfig.json`, `*.ts`, `*.tsx`, `*.js`, `*.jsx`

## CLAUDE.md sections to include

### Commands
```bash
npm install          # or: pnpm install, yarn
npm run dev          # dev server
npm run build        # production build
npm run lint         # linting
npm test             # test suite
```
Adapt based on actual scripts in package.json.

### Conventions
- TypeScript strict mode, avoid `any`
- camelCase for variables/functions, PascalCase for components/classes/types
- ES modules (`import/export`), not CommonJS (`require`)
- Prefer `const` over `let`, never `var`
- Use optional chaining (`?.`) and nullish coalescing (`??`)

### Prohibitions
- NEVER use `eval()` or `Function()` constructor
- NEVER use `dangerouslySetInnerHTML` without sanitization (React)
- NEVER commit node_modules or .env files

## Permissions to allow
```
Bash(npm run:*), Bash(npm test:*), Bash(npx prettier:*), Bash(npx tsc:*)
```

## Formatting hook
Prettier (if .prettierrc or prettier in deps): `npx prettier --write "$FILE_PATH"`

## If Express detected
- Convention: middleware-based architecture, error handling middleware last
- Convention: validate request body/params at route level
- Convention: use `express-async-errors` or try/catch in async routes

## If Vite detected
- Add: `Bash(npx vite:*)` to permissions

## If Vitest detected
- Add: `Bash(npx vitest:*)` to permissions
- Convention: co-locate test files with source (*.test.ts next to *.ts)
