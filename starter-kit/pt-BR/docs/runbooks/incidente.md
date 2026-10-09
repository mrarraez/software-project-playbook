# Runbook — Incidente de segurança (segredo vazado)

Fonte: Playbook de Projetos de Software, Parte 06, "Quando o segredo vaza".
A ordem não é sugestão. Principalmente o passo 1 antes do passo 4.

1. **Revogar e rotacionar.** Gere a chave nova e invalide a antiga. Apagar o arquivo ou o commit não desfaz o vazamento.
2. **Conter.** Bloquear acessos, pausar integrações, colocar em manutenção se preciso.
3. **Avaliar o alcance.** Logs de uso da chave, dados acessados, janela de exposição.
4. **Limpar o histórico, se necessário.** `git filter-repo`, e só depois de rotacionar.
5. **Comunicar.** Sponsor. Se o incidente puder causar risco ou dano relevante aos titulares, ANPD (Autoridade Nacional de Proteção de Dados) e titulares em até 3 dias úteis, contados de quando você soube que houve dado pessoal afetado (LGPD, Resolução CD/ANPD 15/2024).
6. **Post-mortem sem culpa.** Linha do tempo, causa raiz, ação preventiva que vira regra, teste ou ADR.
