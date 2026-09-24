---
description: Rotina YAGNI - encontra e propõe limpeza e compactação de código e documentos
---
Modo AUDITORIA. Não apague, mova ou edite nada antes do meu "aprovado".
Delegue ao subagente curador-yagni; relatório em
docs/_arquivo/faxina-AAAA-MM-DD.md.

Escopo:
1. Código: exports, arquivos e dependências não usados (knip, depcheck
   ou vulture, conforme a stack); feature flags mortas; TODOs com mais
   de 30 dias.
2. Documentos: rascunhos, duplicatas, docs superados por ADR mais nova,
   arquivos não referenciados.
3. Tamanho: CLAUDE.md > 150 linhas; LOG-DE-DECISOES.md > 300 linhas;
   STATUS.md > 40 linhas; HANDOFF.md > 20 linhas.
4. Para cada item: MANTER / COMPACTAR / ARQUIVAR (docs/_arquivo/) /
   APAGAR + motivo em 1 linha.
5. LOG: entradas com mais de 60 dias viram resumo em
   docs/_arquivo/log-AAAA-TN.md; no LOG fica 1 linha de ponteiro.
6. Aplique o teste YAGNI ao código especulativo (existe requisito hoje?
   será usado nas próximas 2 missões? é caro adicionar depois?).

Me devolva só: tabela resumida (máx. 20 linhas) + caminho do
relatório + diff proposto.
