# Runbook — Restore a backup (monthly drill, ~20 min)

Prerequisite: ADR-0002 (frequency, retention, where the copy lives).

1. Pick the most recent off-disk backup and note the date/time.
2. Spin up a disposable database, separate from the development one:
   docker run -d --name restore-test -e POSTGRES_PASSWORD=test \
     -p 127.0.0.1:55433:5432 postgres:16-alpine
3. Restore (dump in custom format, generated with pg_dump -Fc):
   PGPASSWORD=test pg_restore -h 127.0.0.1 -p 55433 -U postgres \
     -d postgres --create <file.dump>
4. Verify: row counts of the main tables and the
   most recent record match what's expected.
5. Time steps 1 through 4 and log it in the DECISION-LOG:
   date | backup used | time | result | issues.
6. Destroy the environment: docker rm -f restore-test
