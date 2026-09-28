#!/bin/sh
# Database backup: dump in custom format (what the runbook's pg_restore expects),
# kept in backups/ and deleted after 14 days.
# Schedule it in the deploy user's cron (Part 05, "Live, on a VPS"):
#   30 3 * * * cd ~/myproject && sh infra/backup.sh >> ~/backup.log 2>&1
# The copy off the VPS is a separate step: ADR-0002 says where it goes.
set -eu
cd "$(dirname "$0")/.."
mkdir -p backups
file="backups/$(date +%Y%m%d-%H%M).dump"
# user and database come from the Postgres container's own variables
if ! docker compose exec -T db sh -c 'pg_dump -U "$POSTGRES_USER" -Fc "$POSTGRES_DB"' > "$file"; then
  rm -f "$file"
  echo "$(date '+%F %T') backup FAILED"
  exit 1
fi
find backups -name '*.dump' -mtime +14 -delete
echo "$(date '+%F %T') ok $file"
