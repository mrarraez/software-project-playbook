#!/bin/sh
# Teste de fumaça: a app responde pela internet, com HTTPS válido?
# Uso, do seu computador: sh infra/fumaca.sh seudominio.com.br
set -eu
for rota in /api/health /api/ready /; do
  if curl -fsS --max-time 10 -o /dev/null "https://$1$rota"; then
    echo "ok     $rota"
  else
    echo "FALHA  $rota: faça o rollback (docs/runbooks/rollback.md)"
    exit 1
  fi
done
