# Runbook — Rollback (~5 min)

Quando: o smoke test falhou depois de um deploy, ou um erro grave apareceu em produção.
Primeiro volte, depois investigue.

1. Se a versão nova migrou o banco, desfaça a migração antes de trocar a imagem
   (toda migração é reversível, Parte 03). Se não der, restaure o backup
   anterior ao deploy (restaurar-backup.md).
2. Troque VERSAO no .env pela versão anterior (anotada no passo 1 do deploy.md).
3. Suba a versão anterior:
   docker compose --profile app pull
   docker compose --profile app up -d --no-build
4. Confira por fora, do seu computador: sh infra/smoke-test.sh <dominio>
5. Avise o sponsor se usuários foram afetados.
6. Investigue com o site no ar: o que falhou, por que o CI não pegou e qual
   teste passa a pegar (post-mortem sem culpa, Parte 06).
7. Registre no LOG-DE-DECISOES:
   data | versão que falhou | versão restaurada | causa | ação preventiva.
