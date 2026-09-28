# Runbook — Deploy de uma versão (~10 min)

Pré-requisitos: tag vX.Y.Z criada e imagens publicadas pelo release-images;
VPS preparada e checklist do primeiro deploy cumprido (Parte 05, "No ar, numa VPS").

1. Anote a versão que está no ar: grep VERSAO .env
2. Troque VERSAO no .env pela tag nova (ex.: VERSAO=v1.3.0).
3. Baixe as imagens e suba sem compilar:
   docker compose --profile app pull
   docker compose --profile app up -d --no-build
4. Confira por dentro: docker compose --profile app ps (todos healthy).
5. Confira por fora, do seu computador: sh infra/fumaca.sh <dominio>
6. Falhou? Siga rollback.md agora; investigue depois.
7. Registre no LOG-DE-DECISOES:
   data | versão anterior | versão nova | resultado da fumaça.
