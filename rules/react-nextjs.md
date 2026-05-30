# React / Next.js Rules

## Signals
`next.config.*`, `react` in package.json deps, `app/` or `pages/` directory with layout/page files

## CLAUDE.md sections to include

### Conventions (React)
- Functional components only, no class components
- Custom hooks for reusable logic (prefix with `use`)
- Props interfaces defined inline or co-located
- State management: Zustand or React Context (check what's in deps)
- Memoize expensive computations, not every component

### Conventions (Next.js)
- App Router: server components by default, `'use client'` only when needed
- Server components for data fetching, client components for interactivity
- Use `next/image` for images, `next/link` for navigation
- Server actions for mutations (prefer over API routes)
- Metadata API for SEO

### Prohibitions
- NEVER fetch data in client components when server components can do it
- NEVER use `useEffect` for data fetching in Next.js -- use server components or SWR/React Query
- Always run `npm run build` before pushing -- catches SSR errors that dev mode misses

## Testing
- Vitest or Jest for unit tests
- Playwright for E2E
- React Testing Library for component tests
- Always test mobile viewport before marking frontend work complete
