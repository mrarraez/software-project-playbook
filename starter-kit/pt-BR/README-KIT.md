# Starter Kit · como usar

Este kit acompanha o livro *Playbook de Projetos de Software*. Tudo aqui está explicado nas Partes 02 a 10.

1. Copie o conteúdo desta pasta para a raiz do seu repositório novo (o bootstrap da Parte 02 faz isso por você).
2. Preencha o `CLAUDE.md` (máximo de 150 linhas) e crie o `.env` a partir do `.env.example`.
3. Instale o hook: `cp scripts/hooks/pre-push .git/hooks/ && chmod +x .git/hooks/pre-push`
4. Suba as dependências: `docker compose up -d`
5. No Claude Code: `/agents` para conferir os agentes e `/retomar` para começar.

Projeto pequeno? Comece com cinco agentes (gerente-projeto, arquiteto, engenheiro-backend ou
engenheiro-frontend, qa-testes e seguranca) e apague os outros até a dor aparecer.
