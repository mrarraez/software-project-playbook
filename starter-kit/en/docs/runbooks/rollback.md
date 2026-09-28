# Runbook — Rollback (~5 min)

When: the smoke test failed after a deploy, or a serious error showed up in production.
Go back first, investigate afterwards.

1. If the new version migrated the database, undo the migration before switching
   the image (every migration is reversible, Part 03). If that isn't possible,
   restore the backup taken before the deploy (restore-backup.md).
2. Change VERSION in .env to the previous version (noted in step 1 of deploy.md).
3. Bring the previous version up:
   docker compose --profile app pull
   docker compose --profile app up -d --no-build
4. Check from the outside, from your computer: sh infra/smoke-test.sh <domain>
5. Tell the sponsor if users were affected.
6. Investigate with the site up: what failed, why CI didn't catch it and which
   test will catch it from now on (blameless post-mortem, Part 06).
7. Record it in the DECISION-LOG:
   date | failed version | restored version | cause | preventive action.
