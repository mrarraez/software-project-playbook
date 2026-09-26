# Política mínima de uso de IA — <NOMBRE DEL PROYECTO>
**Versión:** 1 · **Fecha:** AAAA-MM-DD · **Dueño:** <nombre>
**Revisar:** en cada cambio de plan, herramienta o modelo; como mínimo cada 6 meses
Alineada con los principios de la política de IA de la organización, si existe: <enlace>.
No es asesoría jurídica ni garantía de cumplimiento legal.

## 1. Herramienta y plan
Herramienta: Claude Code · Plan: <Pro/Max | Team/Enterprise | API>
Cuentas autorizadas: <quién>
El plan define las reglas de entrenamiento y de retención
(documentación oficial, página "Data usage").

## 2. Qué puede y qué no puede ir al modelo
| Puede | No puede |
|---|---|
| Código y docs de este repositorio | Secretos: `.env`, claves, tokens |
| Datos sintéticos o anonimizados | Datos personales reales sin base legal registrada (ley de protección de datos) |
| Logs sin datos personales | Material de terceros bajo confidencialidad, sin autorización escrita |

Todo lo que el agente lee va al modelo: archivo abierto,
salida de comando, página consultada.

## 3. Privacidad y retención (verificado el AAAA-MM-DD)
- Entrenamiento con tus datos: <desactivado en claude.ai/settings/data-privacy-controls |
  plan comercial: no entrena, salvo adhesión a un programa de socios>
- Retención en el proveedor: <30 días | 5 años, si el entrenamiento está activado |
  retención cero (Enterprise elegible)>
- Copia local: transcripciones en `~/.claude/projects/` durante 30 días;
  `cleanupPeriodDays` en el settings.json: <valor>
- `/feedback`, `/bug` y `/share` envían la conversación, con código,
  que se guarda 5 años: <permitido | DISABLE_FEEDBACK_COMMAND=1>
- Telemetría: <predeterminada | DISABLE_TELEMETRY=1 |
  CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1>

## 4. Responsabilidad humana
Quien aprueba el merge responde por el código, escrito por una persona o por un agente.
Nada generado entra sin DoD, evidencia real y revisión del diff.
El agente no aprueba su propio trabajo.

## 5. Propiedad intelectual y licencias
- A quién pertenece la salida: <fragmento de los términos del plan + enlace>.
  La protección por derecho de autor del código generado por IA varía
  según el país: las dudas van al área jurídica.
- El código generado pasa por la auditoría de licencias junto con las
  dependencias (L11). Fragmento largo que recuerda a un proyecto
  conocido: reescribir o atribuir.
- Skills, agentes y MCPs de terceros: solo con licencia declarada
  y el checklist anticaos.

## 6. Modelo y versión
Los alias (`sonnet`, `opus`, `haiku`) pasan solos a la versión nueva.
- Sesión principal: `"model": "<id completo>"` en el settings.json
- Alias de los agentes, en el `env` del settings.json:
  ANTHROPIC_DEFAULT_SONNET_MODEL=<id> · ANTHROPIC_DEFAULT_OPUS_MODEL=<id>
  · ANTHROPIC_DEFAULT_HAIKU_MODEL=<id>
Cambiar de modelo, versión o plan es un cambio controlado: ADR corta,
misión de prueba con la suite y la matriz de riesgo en marcha, registro en el LOG.

## 7. Incidente con un agente
Ejemplos: borró o cambió datos sin que se lo pidieran; ejecutó un comando
fuera de sus límites; obedeció una instrucción oculta (R04); envió un secreto al modelo.
1. Detener la sesión y revocar lo que el agente alcanzó (clave, token, acceso)
2. Preservar la evidencia: transcripción, diff, comandos ejecutados
3. Evaluar el alcance y restaurar con el runbook de backup
4. Comunicar: dueño del proyecto; titulares de los datos y la autoridad de
   protección de datos si hubo datos personales (ley de protección de datos)
5. Post-mortem sin culpa: la causa se vuelve regla en el CLAUDE.md,
   negación en el settings.json, prueba o ADR
