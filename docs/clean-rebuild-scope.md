# Escopo da reconstrução limpa do Facilitus

## Decisão de arquitetura

A reconstrução limpa não reutilizará o `Application` protegido, o carregador de classes, o manifesto ou os DEX do APK antigo. O APK original será usado somente como inventário funcional e referência visual. Essa decisão evita repetir o crash de inicialização e permite testes, logs e atualizações controláveis.

## Módulos funcionais prioritários

| Ordem | Módulo | Primeira implementação limpa |
|---:|---|---|
| 1 | Identidade e entrada | Logo Facilitus, boas-vindas, identificador do aparelho e cópia para o painel |
| 2 | Ativação | Estado local, tela de bloqueio e contrato de validação do painel |
| 3 | Shell de TV | Navegação por D-pad, foco, voltar e estados offline |
| 4 | Catálogo | Modelos de filmes, séries, novelas, desenhos e canais com dados mockados |
| 5 | Listas | Uma ou várias listas por usuário, com indicação de lista privada |
| 6 | Player | Interface isolada, inicialmente com fonte de homologação autorizada |
| 7 | EPG e busca | Contratos independentes, sem endpoints hardcoded |
| 8 | Conta e configurações | Sessão, logout, DNS configurável e preferências visuais |

## Inventário do APK antigo

O APK original contém atividades, player, catálogo, login, configurações, EPG, recursos de mídia e integrações externas. Esses comportamentos serão tratados como requisitos a validar, e não como código a ser copiado. Permissões, serviços em segundo plano, receptores, WebView, MQTT, anúncios, compras e atualização remota ficarão desativados até existir finalidade de produto, contrato autorizado e revisão de segurança.

## Fora do primeiro ciclo

Atualização remota de APK, instalação de pacotes, janela sobre outros aplicativos, MQTT, anúncios, compras, WebView não essencial, coleta ampla de identificadores, alteração de sistema e endpoints descobertos no APK permanecem fora do primeiro ciclo. Eles só entram após contrato autorizado e testes de regressão.

## Critério da primeira build limpa

A primeira build será considerada pronta quando instalar e abrir em um dispositivo Android sem depender do shell antigo, mostrar o logo e a mensagem de boas-vindas, exibir um identificador de dispositivo estável, permitir copiar esse identificador para o painel e permanecer em uma tela útil mesmo quando a rede ou o backend estiverem indisponíveis.

## Observação sobre o MAC

No Android moderno, o endereço MAC físico pode ser ocultado ou aleatorizado pelo sistema e pelo fabricante. Por isso, a base limpa usará um identificador de dispositivo persistente gerado pelo app como fallback, exibirá claramente o tipo do identificador e permitirá copiar o valor para o painel. Se o painel exigir especificamente um MAC físico, essa exigência deverá ser validada no aparelho-alvo antes da ativação de produção.
