#!/bin/sh
# Prueba de humo: ¿la app responde por internet, con HTTPS válido?
# Uso, desde tu computadora: sh infra/prueba-humo.sh tudominio.com
set -eu
for ruta in /api/health /api/ready /; do
  if curl -fsS --max-time 10 -o /dev/null "https://$1$ruta"; then
    echo "ok     $ruta"
  else
    echo "FALLA  $ruta: haz el rollback (docs/runbooks/rollback.md)"
    exit 1
  fi
done
