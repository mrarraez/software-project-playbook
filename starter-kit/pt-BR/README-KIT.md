# Starter Kit · como usar

Este kit acompanha o livro *Playbook de Projetos de Software*. Tudo aqui está explicado nas Partes 02 a 10.

## Como usar

1. Copie o conteúdo desta pasta para a raiz do seu repositório novo (o bootstrap da Parte 02 faz isso por você).
2. Preencha o `CLAUDE.md` (máximo de 150 linhas) e crie o `.env` a partir do `.env.example`.
3. Instale o hook: `cp scripts/hooks/pre-push .git/hooks/ && chmod +x .git/hooks/pre-push`
4. Suba as dependências: `docker compose up -d`
5. No Claude Code: peça ao Claude para listar os agentes carregados e rode `/retomar` para começar.

## Pré-requisitos

- Git
- Docker Desktop
- Claude Code

## Bootstrap em 1 minuto

```bash
git clone --branch v1.3.0 https://github.com/mrarraez/software-project-playbook ../playbook-kit
git init -b main
git commit --allow-empty -m "chore: commit inicial"
git remote add origin <url do seu repositório privado>
git push -u origin main   # o único push na main, antes de o hook existir
cp -r ../playbook-kit/starter-kit/pt-BR/. .
cp scripts/hooks/pre-push .git/hooks/ && chmod +x .git/hooks/pre-push
cp .env.example .env      # e preencha com valores reais
docker compose up -d
git checkout -b missao/01-fundacao
git add . && git commit -m "chore: fundação do projeto (estrutura, agentes, comandos)"
```

Depois disso, abra o Claude Code e rode `/retomar`.

Projeto pequeno? Comece com cinco agentes (gerente-projeto, arquiteto, engenheiro-backend ou
engenheiro-frontend, qa-testes e seguranca) e apague os outros até a dor aparecer.
