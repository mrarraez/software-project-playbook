# ADR-0001 — Estrategia de contenerización

Estado: APROBADA · Fecha: 2026-09-30 · Decisor: Lucas (dueño técnico), con conocimiento de Rita

> Ejemplo completo de Agenda, el proyecto ficticio de la Bitácora del libro.
> Borra la carpeta `docs/ejemplos/` cuando empieces tu proyecto.

## Contexto

Destino de deploy: una VPS · Personas/máquinas: 1 dev, 1 máquina (Windows)
Servicios: API, worker de mensajes (programador de tareas) y base de datos · Dependencias nativas: ninguna

## Opciones

A — Nada en contenedor (todo nativo)
B — Dependencias en contenedor, app nativa   ← mínimo aceptable
C — Todo en contenedor (app + dependencias) desde ya

## Criterios

Matriz de la Parte 05: 3 de 7 marcan SÍ (destino de deploy en una VPS; tres servicios; paridad entre
desarrollo y producción, porque la agenda de una clínica no puede fallar el día en que la recepción depende de ella)

## Decisión

C. Con tres SÍ, la aplicación va al contenedor ahora. El worker de mensajes usa la misma imagen que la API,
con otro comando. Las herramientas de verificación (escáner de seguridad, lint) quedan en una imagen propia y
nunca entran en la imagen de la aplicación.

## Disparador de revisión

Revisar si el destino de deploy cambia a una plataforma que empaqueta por su cuenta.

## Consecuencias

Puertos: app 3100 / db 55433, solo en 127.0.0.1 · Runtime: Docker Desktop · Imágenes con versión fija
