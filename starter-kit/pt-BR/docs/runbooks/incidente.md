# Runbook — Incidente de segurança (segredo vazado)

Fonte: Playbook de Projetos de Software, Parte 06, "Quando o segredo vaza".
A ordem não é sugestão. Principalmente o passo 1 antes do passo 4.

1. **Revogar e rotacionar.** Gere a chave nova e invalide a antiga. Apagar o arquivo ou o commit não desfaz o vazamento.
2. **Conter.** Bloquear acessos, pausar integrações, colocar em manutenção se preciso.
3. **Avaliar o alcance.** Logs de uso da chave, dados acessados, janela de exposição.
4. **Limpar o histórico, se necessário.** `git filter-repo`, e só depois de rotacionar. Ele reescreve o histórico, e quem já clonou o repositório precisa refazer o clone.
5. **Comunicar.** Sponsor. Com dado pessoal afetado, veja o prazo legal logo abaixo.
6. **Post-mortem sem culpa.** Linha do tempo, causa raiz, ação preventiva que vira regra, teste ou ADR.
