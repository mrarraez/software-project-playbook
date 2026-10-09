# Runbook — Deploy de una versión (~10 min)

Prerrequisitos: tag vX.Y.Z creado e imágenes publicadas por release-images;
VPS preparada y checklist del primer deploy cumplido (Parte 05, "En producción, en una VPS").

1. Anota la versión que está en producción: grep VERSION .env
2. Cambia VERSION en el .env por el tag nuevo (ej.: VERSION=v1.3.0).
3. Descarga las imágenes y levántalas sin compilar:
   docker compose --profile app pull
   docker compose --profile app up -d --no-build
4. Verifica por dentro: docker compose --profile app ps (todos healthy).
5. Verifica desde fuera, desde tu computadora: sh infra/smoke-test.sh <dominio>
6. ¿Falló? Sigue rollback.md ahora; investiga después.
7. Regístralo en el LOG-DE-DECISIONES:
   fecha | versión anterior | versión nueva | resultado del smoke test.
