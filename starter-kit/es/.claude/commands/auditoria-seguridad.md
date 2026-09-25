---
description: Auditoría de seguridad (diff o completa) guiada por los 12 riesgos
argument-hint: [diff | completa]
---
Alcance: $ARGUMENTS (por defecto: diff desde el último tag/merge a main).
Delega al subagente seguridad.

Reglas:
- Solo repositorio y entorno local/prueba. Sin carga en producción,
  sin escanear servicios externos, sin imprimir secretos.
- Base: docs/seguridad/12-riesgos.md (Parte 06).
- Ejecuta las herramientas disponibles: gitleaks, npm audit / osv-scanner,
  semgrep, trivy (imágenes), auditoría de licencias.
- Cabeceras: `curl -sI` sobre la app local (versión en Server y
  X-Powered-By; faltan HSTS, CSP, nosniff, Referrer-Policy,
  Permissions-Policy). Runtime, base de datos e imagen base contra
  el fin de soporte (endoflife.date).
- Cada hallazgo: flujo de datos, archivo:línea, condición, impacto,
  reproducción mínima con datos ficticios. Clasifica CONFIRMADO /
  SOSPECHA / NO VERIFICADO. Una búsqueda textual vacía no es prueba de
  seguridad.
- Correcciones: diff mínimo + prueba de regresión que falla antes y
  pasa después.

Guárdalo en docs/seguridad/auditorias/AAAA-MM-DD.md y devuélveme solo:
bloqueadores de publicación, mejoras, dependencias externas y
riesgo residual (máx. 20 líneas).
