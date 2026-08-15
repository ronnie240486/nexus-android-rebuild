# Arquitetura da recriação manual do Facilitus

A recriação será um aplicativo Android novo, com `applicationId` próprio e sem carregar o `Application`, os DEX ou as bibliotecas do NEXUS. O APK original será usado como referência funcional e visual, enquanto a implementação será organizada por módulos testáveis.

## Mapa de módulos

| Módulo | Tela equivalente do original | Contrato inicial |
|---|---|---|
| Entrada | `Pre_launcher`, `LoginActivity`, `LoginLandActivity` | Boas-vindas, identificador do aparelho, ativação e sessão. |
| Servidor | `ServerAddressSettingActivity` | Até cinco endpoints configuráveis, sem host hardcoded. |
| Home | `HomeActivity` | Destaques, categorias, busca, live e acesso às listas privadas. |
| Live | `LivePlayer`, `LivePlayerVertical` | Categorias, canais, fontes, troca de canal e EPG. |
| VOD | `VodPlayer`, Activities de detalhes e álbum | Filmes, séries, episódios, reprodução e histórico. |
| EPG | `EPGMainActivity`, `EPGSingleChannelActivity` | Grade por canal e programação do dia. |
| Busca | `SearchActivity`, `SearchActivityPortrait`, `SearchActivityV3` | Busca, histórico, resultados e filtros. |
| Favoritos | `FavVideoActivity`, `VideoFavFragmentActivity` | Favoritos de vídeos e canais. |
| Configurações | `SettingFragmentActivity` | Player, idioma, rede, servidor, aparência e saída. |
| Conta | `UserRegisterActivity`, `RegisterActivity`, `ForgetPwdActivity` | Cadastro, login, recuperação e status da conta. |

## Navegação

A aplicação usará uma única Activity hospedeira com telas desacopladas e estado de navegação explícito. Cada tela terá eventos de entrada, saída, carregamento, erro e retorno. A navegação por toque e por D-pad será tratada pelo mesmo contrato de foco.

## Dados

O catálogo, as listas e o EPG serão representados por modelos próprios. O reprodutor será encapsulado atrás de uma interface para que a fonte de mídia possa ser trocada sem alterar a interface. Nenhum endpoint ou credencial extraído do APK será usado automaticamente.

## Identificador e ativação

O aplicativo mostrará um código numérico de 12 dígitos derivado do MAC quando o sistema fornecer o endereço de hardware; quando o Android ocultar o MAC, usará um identificador persistente de fallback. O painel será a autoridade para vincular o código a um usuário e suas listas. A Home ficará bloqueada até a resposta de ativação `ACTIVE`.

## Ordem de implementação

A primeira fatia vertical será Entrada → Ativação → Home offline → Configuração de servidor. Depois serão adicionados catálogo, busca, listas, live, EPG, VOD, favoritos, conta e configurações. Cada fatia será compilada e testada antes da próxima, evitando o tipo de crash causado pelo reempacotamento do shell original.
