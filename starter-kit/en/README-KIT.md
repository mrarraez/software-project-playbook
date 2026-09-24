# Starter Kit · how to use

This kit accompanies the book *Software Project Playbook*. Everything here is explained in Parts 02 to 10.

## How to use

1. Copy the contents of this folder to the root of your new repository (the Part 02 bootstrap does this for you).
2. Fill in `CLAUDE.md` (max. 150 lines) and create `.env` from `.env.example`.
3. Install the hook: `cp scripts/hooks/pre-push .git/hooks/ && chmod +x .git/hooks/pre-push`
4. Bring up the dependencies: `docker compose up -d`
5. In Claude Code: `/agents` to check the agents and `/resume-work` to start.

## Prerequisites

- Git
- Docker Desktop
- Claude Code

## 1-minute bootstrap

```bash
git clone --branch v1.1.0 https://github.com/mrarraez/software-project-playbook ../playbook-kit
git init -b main
git commit --allow-empty -m "chore: initial commit"
git remote add origin <your private repository URL>
git push -u origin main   # the only push to main, before the hook exists
cp -r ../playbook-kit/starter-kit/en/. .
cp scripts/hooks/pre-push .git/hooks/ && chmod +x .git/hooks/pre-push
cp .env.example .env      # and fill in with real values
docker compose up -d
git checkout -b mission/01-foundation
git add . && git commit -m "chore: project foundation (structure, agents, commands)"
```

After that, open Claude Code and run `/resume-work`.

Small project? Start with five agents (project-manager, architect, backend-engineer or
frontend-engineer, qa-tester, and security) and delete the others until the pain shows up.
