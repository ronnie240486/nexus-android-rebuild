# Roadmap de reconstrução

## Objetivo

Construir uma versão Android moderna e auditável do NEXUS, preservando somente os comportamentos autorizados e úteis do APK original. O trabalho será conduzido em incrementos pequenos, com uma build instalável em cada marco e sem depender de código decompilado como fonte de verdade.

## Marco 0 — Fundação e segurança

O primeiro marco cria a aplicação limpa, define variantes de ambiente e centraliza configuração em um contrato explícito. Nenhum host, chave, token, certificado ou identificador de parceiro deve ficar embutido no código-fonte. O manifesto será reduzido ao mínimo, os componentes exportados serão justificados e os logs serão saneados.

**Saída:** build de demonstração com tela inicial, diagnóstico de conectividade e configuração de backend substituível.

## Marco 1 — Shell de TV e navegação

A segunda etapa implementa tema, tipografia, estados de foco, navegação por D-pad, tratamento de voltar, orientação e acessibilidade para TV. A tela inicial deve ser independente de rede e oferecer estados de carregamento, vazio e erro.

**Saída:** shell navegável com dados mockados e testes de navegação.

## Marco 2 — Conteúdo e reprodução

A terceira etapa adiciona cliente de catálogo, canais, EPG e player HLS/HTTP(S), com timeout, retry, cache controlado e telemetria local opcional. O player deverá lidar com falha de rede, troca de qualidade e encerramento sem deixar serviço órfão.

**Saída:** fluxo completo mockado e um ambiente de homologação autorizado.

## Marco 3 — Conta e personalização

Depois do catálogo estável, entram login, cadastro, favoritos, histórico e configurações. Dados sensíveis devem usar armazenamento apropriado e o contrato de autenticação precisa ser documentado antes da integração.

**Saída:** sessão persistente, logout completo e sincronização tolerante a falhas.

## Marco 4 — EPG, busca e módulos opcionais

EPG, busca avançada, conteúdo personalizado, compras, anúncios, WebView e atualização remota devem ser tratados como módulos independentes. Cada módulo só será ativado quando existir uma finalidade clara, uma origem de dados autorizada e uma revisão de segurança.

**Saída:** módulos opcionais com feature flags e testes de regressão.

## Decisões pendentes do produto

| Tema | Pergunta que precisa de resposta |
|---|---|
| Conteúdo | O NEXUS consumirá quais fontes e formatos de conteúdo? |
| Backend | Existe uma API própria, documentação ou painel que devemos integrar? |
| Autenticação | O login será por conta, código, dispositivo ou outro mecanismo? |
| TV | O alvo principal é Android TV, set-top box, celular ou todos? |
| Branding | O nome, ícone, cores e imagens serão mantidos ou substituídos? |
| Atualizações | A distribuição será Play Store, sideload controlado ou MDM? |
| Monetização | Anúncios e compras permanecem no escopo? |
| Compatibilidade | Qual versão mínima e quais dispositivos precisam ser suportados? |

## Critérios de pronto para a primeira implementação

A primeira implementação só deve começar quando houver respostas para conteúdo, backend, autenticação e alvo de dispositivo. Com isso, é possível criar uma base limpa sem adivinhar contratos ou reproduzir comportamentos de risco apenas porque aparecem no APK original.
