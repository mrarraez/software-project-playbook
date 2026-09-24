# Starter Kit · cómo usarlo

Este kit acompaña al libro *Playbook de Proyectos de Software*. Todo esto está explicado en las Partes 02 a 10.

## Cómo usarlo

1. Copia el contenido de esta carpeta a la raíz de tu repositorio nuevo (el bootstrap de la Parte 02 lo hace por ti).
2. Completa el `CLAUDE.md` (máximo 150 líneas) y crea el `.env` a partir de `.env.example`.
3. Instala el hook: `cp scripts/hooks/pre-push .git/hooks/ && chmod +x .git/hooks/pre-push`
4. Levanta las dependencias: `docker compose up -d`
5. En Claude Code: `/agents` para revisar los agentes y `/retomar` para empezar.

## Prerrequisitos

- Git
- Docker Desktop
- Claude Code

## Bootstrap en 1 minuto

```bash
git clone --branch v1.1.0 https://github.com/mrarraez/software-project-playbook ../playbook-kit
git init -b main
git commit --allow-empty -m "chore: commit inicial"
git remote add origin <URL de tu repositorio privado>
git push -u origin main   # el único push a main, antes de que exista el hook
cp -r ../playbook-kit/starter-kit/es/. .
cp scripts/hooks/pre-push .git/hooks/ && chmod +x .git/hooks/pre-push
cp .env.example .env      # y complétalo con valores reales
docker compose up -d
git checkout -b mision/01-fundacion
git add . && git commit -m "chore: fundación del proyecto (estructura, agentes, comandos)"
```

Después de eso, abre Claude Code y ejecuta `/retomar`.

¿Proyecto pequeño? Empieza con cinco agentes (gerente-proyecto, arquitecto, ingeniero-backend o
ingeniero-frontend, qa-pruebas y seguridad) y elimina los demás hasta que aparezca el dolor.
