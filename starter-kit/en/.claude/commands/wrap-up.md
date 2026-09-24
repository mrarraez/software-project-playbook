---
description: Ends the session by saving the state to a file and releasing resources
---
We are going to WRAP UP the session. Nothing can be lost when I run /clear or /exit.

1. Don't leave anything halfway: if there is a migration, commit, or write
   in progress, finish or revert it safely. Let me know.
2. Overwrite docs/state/STATUS.md (max. 40 lines): date, current
   mission, % complete, done today, what's left, blockers, new risks.
3. Append to docs/state/DECISION-LOG.md each decision from this
   session: date | decision | who decided | reason | reversible?
4. Overwrite docs/state/HANDOFF.md: EXACT next step, commands
   to run, files to open, known gotchas.
5. Commit on the current branch (NEVER main):
   `chore(state): wrap-up YYYY-MM-DD`. Do not push without my request.
6. Release resources: stop dev servers and watchers you started;
   run `docker compose stop` (NEVER `down -v`).
7. Confirm in up to 8 lines what was saved and what is still running
   (if anything), and write last:
   "State saved. You can run /clear (or /exit)."
