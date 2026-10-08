## Qué cambia

<1 a 3 frases: el resultado, la misión (MNN) y la SPEC o ADR vinculada>

## Evidencia

<comando y salida real que prueban el criterio de aceptación>

## Definition of Done (Parte 08)

- [ ] Criterio de aceptación demostrado con evidencia real (comando y salida)
- [ ] Pruebas del caso válido, del inválido y del sin permiso, pasando en el CI
- [ ] Flujos de riesgo crítico y alto validados, con evidencia
- [ ] Todo bug corregido acompañado de una prueba de regresión
- [ ] Revisión del diff por el revisor-codigo, sin ningún BLOQUEA
- [ ] Triggers de seguridad de la Parte 06 revisados
- [ ] Ningún campo ni endpoint nuevo sin aprobación
- [ ] Instrumentación de la métrica funcionando
- [ ] Errores tratados: 4xx útiles, 500 genérico con requestId
- [ ] Accesibilidad básica, si hay pantalla
- [ ] Docs y ADRs actualizados, y ningún documento nuevo sin lector
- [ ] STATUS y LOG actualizados
- [ ] Pantallas principales revisadas en el estado por defecto de quien las va a usar, con datos difíciles
- [ ] Cada check del CI revisado en esta página: un job en cola o un runner detenido no es verde
