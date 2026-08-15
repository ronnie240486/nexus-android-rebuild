# Mapa funcional inicial

Este mapa separa o que foi observado no APK, o que pode ser reimplementado com baixo risco e o que depende de confirmação de produto ou backend.

| Domínio | Evidência observada | Reimplementação inicial | Dependência |
|---|---|---|---|
| Boot | `Pre_launcher`, `BootCompletedReceiver` | Splash local, diagnóstico de configuração e entrada controlada | Política de boot e alvo de dispositivo. |
| Home | `HomeActivity`, layouts de home, banners e carrosséis | Home com dados mockados, foco por D-pad e estados offline | Design e contrato de catálogo. |
| Live | `LivePlayer`, canais e EPG | Lista de canais mockada e player HLS isolado | URLs e autorização de conteúdo. |
| VOD | Álbuns, detalhes, episódios e player | Catálogo paginado e detalhes | API de conteúdo e regras de acesso. |
| Conta | Login, cadastro, esqueci a senha, registro de usuário | Sessão mockada e fluxo de logout | Especificação de autenticação. |
| Favoritos | `FavVideoActivity`, `VideoFavFragmentActivity` e constantes de coleção | Favoritos locais com sincronização opcional | Modelo de usuário. |
| Busca | `SearchActivity*`, palavras quentes e filtros | Busca local sobre dados mockados | Endpoint e regras de indexação. |
| Atualização | `UpdateService`, atividade de diálogo e URL de update legada | Manifesto assinado e atualização fora do app | Distribuição autorizada. |
| Anúncios | `AdsHttpService`, materiais, atividades de anúncio | Feature flag desativada por padrão | Consentimento, origem e política de privacidade. |
| WebView | X5 WebView e `WebViewCommActivity` | Módulo isolado com allowlist | Domínios autorizados e hardening. |
| MQTT | `MqttService` e host legado | Remover da base inicial | Necessidade real e TLS. |
| Compras | compras, pacotes e telas de pagamento | Placeholder não transacional | Provedor, backend e compliance. |

## Primeira fatia vertical

A primeira entrega funcional recomendada é uma fatia pequena e demonstrável: **Home offline com navegação por controle remoto, configuração de ambiente e catálogo mockado**. Ela permite validar marca, foco, layout, arquitetura e telemetria local sem ainda depender de endpoints históricos, credenciais ou serviços de terceiros.

A segunda fatia adiciona uma tela de canais e um player de teste apontando apenas para uma fonte de homologação autorizada. A reprodução não deve ser ligada a hosts descobertos no APK até que sua propriedade e finalidade sejam confirmadas.

## Backlog técnico inicial

| ID | Trabalho | Resultado esperado |
|---|---|---|
| NEXUS-001 | Escolher alvo principal: Android TV, box, celular ou combinação | Matriz de dispositivos e orientação. |
| NEXUS-002 | Definir contrato de configuração de ambiente | `config.example.json` sem segredos. |
| NEXUS-003 | Criar shell de navegação e estados de tela | Home navegável e testável sem rede. |
| NEXUS-004 | Definir modelo de catálogo, canal e programa | DTOs versionados e dados mockados. |
| NEXUS-005 | Definir política de permissões | Manifesto mínimo e justificativas. |
| NEXUS-006 | Escolher biblioteca de player e estratégia de cache | Player isolado com testes de erro. |
| NEXUS-007 | Confirmar API, autenticação e conteúdo | Documento de contrato e ambiente de homologação. |

## Fora do primeiro ciclo

Atualização automática de APK, instalação de pacotes, janela sobre outros apps, MQTT, coleta ampla de identificadores, anúncios, compras e qualquer mecanismo de alteração de sistema ficam fora do primeiro ciclo. A presença desses itens no APK original não é suficiente para justificar sua inclusão na nova versão.
