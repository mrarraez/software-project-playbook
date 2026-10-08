## O que muda

<1 a 3 frases: o resultado, a missão (MNN) e a SPEC ou ADR ligada>

## Evidência

<comando e saída real que provam o critério de aceite>

## Definition of Done (Parte 08)

- [ ] Critério de aceite demonstrado com evidência real (comando e saída)
- [ ] Testes do caso válido, do inválido e do sem permissão, passando no CI
- [ ] Fluxos de risco crítico e alto validados, com evidência
- [ ] Todo bug corrigido acompanhado de teste de regressão
- [ ] Revisão do diff pelo revisor-codigo, sem nenhum BLOQUEIA
- [ ] Triggers de segurança da Parte 06 revisados
- [ ] Nenhum campo ou endpoint novo sem aprovação
- [ ] Instrumentação da métrica funcionando
- [ ] Erros tratados: 4xx úteis, 500 genérico com requestId
- [ ] Acessibilidade básica, se houver tela
- [ ] Docs e ADRs atualizados, e nenhum documento novo sem leitor
- [ ] STATUS e LOG atualizados
- [ ] Telas principais conferidas no estado padrão de quem vai usar, com dados difíceis
- [ ] Cada check do CI conferido nesta página: job na fila ou runner parado não é verde
