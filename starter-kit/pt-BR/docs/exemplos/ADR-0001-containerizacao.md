# ADR-0001 — Estratégia de containerização

Status: APROVADA · Data: 2026-09-30 · Decisor: Lucas (dono técnico), com ciência da Rita

> Exemplo preenchido do Agenda, o projeto fictício do Diário de bordo do livro.
> Apague a pasta `docs/exemplos/` quando começar o seu projeto.

## Contexto

Alvo de deploy: uma VPS · Pessoas/máquinas: 1 dev, 1 máquina (Windows)
Serviços: API, worker de mensagens (agendador) e banco · Dependências nativas: nenhuma

## Opções

A — Nada em container (tudo nativo)
B — Dependências em container, app nativa   ← mínimo aceitável
C — Tudo em container (app + dependências) desde já

## Critérios

Matriz da Parte 05: 3 de 7 apontam SIM (alvo de deploy numa VPS; três serviços; paridade dev e prod,
porque a agenda de uma clínica não pode falhar no dia em que a recepção depende dela)

## Decisão

C. Com três SIM, a aplicação vai para o container agora. O worker de mensagens ganha a mesma imagem da API,
com outro comando. Ferramentas de verificação (scanner de segurança, lint) ficam em imagem própria e nunca
entram na imagem da aplicação.

## Trigger de revisão

Rever se o alvo de deploy mudar para uma plataforma que empacota por conta própria.

## Consequências

Portas: app 3100 / db 55433, só em 127.0.0.1 · Runtime: Docker Desktop · Imagens com versão fixa
