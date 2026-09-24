# Runbook — Restaurar backup (ensaio mensal, ~20 min)

Pré-requisito: ADR-0002 (frequência, retenção, onde fica a cópia).

1. Escolha o backup mais recente fora do disco e anote data/hora.
2. Suba um banco descartável, separado do de desenvolvimento:
   docker run -d --name restore-teste -e POSTGRES_PASSWORD=teste \
     -p 127.0.0.1:55433:5432 postgres:16-alpine
3. Restaure (dump no formato custom, gerado com pg_dump -Fc):
   PGPASSWORD=teste pg_restore -h 127.0.0.1 -p 55433 -U postgres \
     -d postgres --create <arquivo.dump>
4. Verifique: contagem de linhas das tabelas principais e o
   registro mais recente batem com o esperado.
5. Cronometre do passo 1 ao 4 e registre no LOG-DE-DECISOES:
   data | backup usado | tempo | resultado | problemas.
6. Destrua o ambiente: docker rm -f restore-teste
