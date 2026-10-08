#!/bin/sh
# Backup de la base: dump en formato custom (el que espera el pg_restore del runbook),
# guardado en backups/ y borrado después de 14 días.
# Prográmalo en el cron del usuario de deploy (Parte 05, "En producción, en una VPS"):
#   30 3 * * * cd ~/miproyecto && sh infra/backup.sh >> ~/backup.log 2>&1
# La copia fuera de la VPS es otro paso: la ADR-0002 dice adónde va.
set -eu
cd "$(dirname "$0")/.."
mkdir -p backups
archivo="backups/$(date +%Y%m%d-%H%M).dump"
# usuario y base vienen de las variables del propio container de Postgres
if ! docker compose exec -T db sh -c 'pg_dump -U "$POSTGRES_USER" -Fc "$POSTGRES_DB"' > "$archivo"; then
  rm -f "$archivo"
  echo "$(date '+%F %T') FALLA en el backup"
  exit 1
fi
find backups -name '*.dump' -mtime +14 -delete
echo "$(date '+%F %T') ok $archivo"
