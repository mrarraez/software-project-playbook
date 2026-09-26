# CLAUDE.md — <PROJECT NAME>
> Keep this file to AT MOST 150 LINES. Detail goes to docs/
> with a pointer here.

## What it is
<1-2 sentences: problem, for whom, expected outcome>

## Stack
<language/framework/database/versions>
Ports: app 3100, Postgres 55432 (never default ports)

## Where everything lives (read ONLY when needed)
- Current state / next step ...... docs/state/STATUS.md
- Session handoff ................. docs/state/HANDOFF.md
- Decisions (history) ............. docs/state/DECISION-LOG.md
- Architecture decisions .......... docs/adr/
- Metrics and hypotheses .......... docs/00-product/metrics.md
- Mission plan .................... docs/01-planning/mission-roadmap.md
- Security ......................... docs/security/
- Feature specs .................... docs/specs/

## Non-negotiable rules
1. Never commit/push directly to main. Branch per mission: mission/NN-slug.
2. No field/table/endpoint is added or removed without my
   explicit approval.
3. Schema or architecture changes require an ADR BEFORE the code.
4. Secrets only in .env (outside Git) or a secrets manager.
   Never in the frontend.
5. Every decision made in the session goes to DECISION-LOG.md before
   wrapping up.
6. Never delete a file/data without approval. Cleanup = propose,
   I approve, then apply.
7. Validate with evidence (test, command, real output).
   "Should work" is not evidence.

## Context economy
- Use subagents (.claude/agents/) for specialized tasks;
  they return a short summary and write the detail to a file.
- Grep/Glob before Read. Read excerpts, not whole files.
- Code file: warning at 300 lines, mandatory review at 400.
- Do not read node_modules, dist, build, coverage, lockfiles, dumps.
- End of session: /wrap-up. Coming back: /resume-work.

## Worktrees
- In a worktree (.claude/worktrees/), don't run docker compose up
  or down: use the services already running in the main checkout.

## Useful commands
- Bring up dependencies: docker compose up -d
- Tests: <command> · Lint: <command> · Build: <command>
