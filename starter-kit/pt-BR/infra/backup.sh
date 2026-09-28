#!/bin/sh
# Backup do banco: dump no formato custom (o que o pg_restore do runbook espera),
# guardado em backups/ e apagado depois de 14 dias.
# Agende no cron do usuário de deploy (Parte 05, "No ar, numa VPS"):
#   30 3 * * * cd ~/meuprojeto && sh infra/backup.sh >> ~/backup.log 2>&1
# A cópia para fora da VPS é outra etapa: a ADR-0002 diz para onde ela vai.
set -eu
cd "$(dirname "$0")/.."
mkdir -p backups
arquivo="backups/$(date +%Y%m%d-%H%M).dump"
# usuário e banco vêm das variáveis do próprio container do Postgres
if ! docker compose exec -T db sh -c 'pg_dump -U "$POSTGRES_USER" -Fc "$POSTGRES_DB"' > "$arquivo"; then
  rm -f "$arquivo"
  echo "$(date '+%F %T') FALHA no backup"
  exit 1
fi
find backups -name '*.dump' -mtime +14 -delete
echo "$(date '+%F %T') ok $arquivo"
