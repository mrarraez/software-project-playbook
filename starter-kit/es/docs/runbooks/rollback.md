# Runbook — Rollback (~5 min)

Cuándo: el smoke test falló después de un deploy, o apareció un error grave en producción.
Primero vuelve atrás, después investiga.

1. Si la versión nueva migró la base, deshaz la migración antes de cambiar la imagen
   (toda migración es reversible, Parte 03). Si no se puede, restaura el backup
   anterior al deploy (restaurar-backup.md).
2. Cambia VERSION en el .env por la versión anterior (anotada en el paso 1 de deploy.md).
3. Levanta la versión anterior:
   docker compose --profile app pull
   docker compose --profile app up -d --no-build
4. Verifica desde fuera, desde tu computadora: sh infra/smoke-test.sh <dominio>
5. Avisa al patrocinador si hubo usuarios afectados.
6. Investiga con el sitio arriba: qué falló, por qué el CI no lo detectó y qué
   prueba lo detectará de ahora en adelante (post-mortem sin culpa, Parte 06).
7. Regístralo en el LOG-DE-DECISIONES:
   fecha | versión que falló | versión restaurada | causa | acción preventiva.
