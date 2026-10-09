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
   STATUS.md > 40 linhas; HANDOFF.md > 20 linhas; arquivos de código
   > 300 linhas (candidatos a divisão) e > 400 (revisão obrigatória).
4. Para cada item: MANTER / COMPACTAR / ARQUIVAR (docs/_arquivo/) /
   APAGAR + motivo em 1 linha.
5. Diários (LOG, CHANGELOG, riscos, mudanças, status semanal): entradas
   fora da missão atual e da anterior vão para
   docs/_arquivo/<nome>/AAAA-MM.md (mês da entrada); no arquivo fica
   1 linha de ponteiro.
6. Aplique o teste YAGNI ao código especulativo (existe requisito hoje?
   será usado nas próximas 2 missões? é caro adicionar depois?).
7. Antes e depois de aplicar qualquer remoção de código, rode a suíte
   de testes: código "não usado" pode ser chamado por reflexão ou
   injeção de dependência.

Me devolva só: tabela resumida (máx. 20 linhas) + caminho do
relatório + diff proposto.
