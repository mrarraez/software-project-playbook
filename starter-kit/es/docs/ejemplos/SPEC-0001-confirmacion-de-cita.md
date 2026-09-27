# SPEC-0001 — Confirmación de cita por mensaje de texto

**Estado:** APROBADA · **Misión:** M02 · **Fecha:** 2026-10-05

> Ejemplo completo de Agenda, el proyecto ficticio de la Bitácora del libro.
> Úsalo como modelo para completar el tuyo y borra la carpeta `docs/ejemplos/` cuando empieces tu proyecto.

## Objetivo

Reducir las inasistencias en las tres clínicas: el paciente recibe la confirmación de la cita por mensaje de
texto y responde SÍ o NO. Métrica afectada: tasa de inasistencias (docs/00-producto/metricas.md).

## Requisitos

| ID | Requisito | Criterio de aceptación (con caso negativo) |
|---|---|---|
| REQ-001 | Enviar la confirmación por mensaje de texto 24 h antes de la cita | Dada una cita mañana a las 10 h, Cuando el programador de tareas se ejecuta hoy a las 10 h, Entonces el paciente recibe fecha, hora y clínica. Dado un paciente sin teléfono registrado, Entonces no se envía nada y la recepción ve la alerta "sin teléfono" |
| REQ-002 | Nunca enviar la confirmación por correo electrónico | Dado un paciente con correo y teléfono, Cuando sale la confirmación, Entonces solo se envía el mensaje de texto y ningún correo aparece en el log de envíos |
| REQ-003 | La respuesta NO libera el horario | Dada la respuesta NO, Entonces el horario vuelve a la agenda en hasta 1 minuto y se avisa a la recepción. Dada una respuesta fuera del patrón ("quizás"), Entonces el horario sigue reservado y la recepción ve la respuesta |

## Fuera de alcance

- Recordatorio 2 horas antes de la cita (entra en el roadmap si la tasa de inasistencias no baja)
- Reprogramación por el propio paciente

## Vacíos (lo que todavía no se sabe)

| Vacío | Quién decide | Hasta cuándo |
|---|---|---|
| Proveedor de envío de mensajes (se convierte en ADR-0003) | Lucas | 3.er día de la M02 |
| Texto exacto del mensaje | Rita | 3.er día de la M02 |

## Tareas (hasta 1 día cada una)

- [ ] T1 — Programador de tareas diario que selecciona las citas de mañana (REQ-001)
- [ ] T2 — Envío por el proveedor, con la credencial solo en el `.env` (REQ-001)
- [ ] T3 — Prueba que demuestra que no sale ningún correo, ni con correo registrado (REQ-002)
- [ ] T4 — Procesar la respuesta y liberar el horario con el NO (REQ-003)
- [ ] T5 — Alerta "sin teléfono" en la pantalla de la recepción (REQ-001)
- [ ] T6 — Las pruebas levantan el servidor con la credencial del proveedor vacía, sin llamada real (REQ-001)

## Referencias

Fuente de REQ-001 a REQ-003: entrevista con Rita el 2026-09-28, con las notas revisadas con ella antes de la
aprobación (el resumen del agente había invertido el REQ-002; ver la Bitácora de la Parte 01).
ADR-0001 (contenerización) · métrica en docs/00-producto/metricas.md
