---
description: Resumes the project with minimal context from the state files
argument-hint: [optional session focus]
---
You are RESUMING work. Goal: understand where we left off
spending the minimum tokens.

1. Read ONLY docs/state/STATUS.md and docs/state/HANDOFF.md
   (if it exists). Do not read the repository.
2. Run: `git status --short`, `git log --oneline -5`, and
   `git branch --show-current`.
3. Run `docker compose ps` just to see the state. Do NOT start anything yet.
4. If HANDOFF points to a file or ADR needed for the next
   step, read only that one (or the excerpt).
5. Answer in at most 12 lines:
   - Where we left off (mission / task)
   - Exact next step
   - Decisions pending with me
   - Discrepancies between STATUS and what git shows
   - Services I will need to start
6. STOP and wait for my "ok" before executing anything.

Requested focus for this session (if any): $ARGUMENTS
