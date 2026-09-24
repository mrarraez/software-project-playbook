---
description: Auditoria de segurança (diff ou completa) guiada pelos 12 riscos
argument-hint: [diff | completa]
---
Escopo: $ARGUMENTS (padrão: diff desde a última tag/merge na main).
Delegue ao subagente seguranca.

Regras:
- Somente repositório e ambiente local/teste. Sem carga em produção,
  sem varrer serviços externos, sem imprimir segredos.
- Base: docs/seguranca/12-riscos.md (Parte 06).
- Rode as ferramentas disponíveis: gitleaks, npm audit / osv-scanner,
  semgrep, trivy (imagens), auditoria de licenças.
- Cada achado: fluxo de dados, arquivo:linha, condição, impacto,
  reprodução mínima com dados fictícios. Classifique CONFIRMADO /
  SUSPEITA / NÃO VERIFICADO. Busca textual vazia não é prova de
  segurança.
- Correções: diff mínimo + teste de regressão que falha antes e
  passa depois.

Grave em docs/seguranca/auditorias/AAAA-MM-DD.md e me devolva só:
bloqueadores de publicação, melhorias, dependências externas e
risco residual (máx. 20 linhas).
