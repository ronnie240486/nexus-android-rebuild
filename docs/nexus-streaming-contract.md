# Contrato de streaming observado no NEXUS

Este documento registra o que foi confirmado no APK original para orientar a reconstrução do Facilitus.

## Capacidades observadas

| Área | Evidência no APK original | Reimplementação Facilitus |
|---|---|---|
| Entrada | `Pre_launcher`, login retrato/paisagem e ativação de conta | Tela Facilitus com identificador de 12 dígitos e sessão. |
| Identificador | Chave interna `mac_di` e leitura de identidade do aparelho | Código do aparelho copiado para o painel. |
| Listas | Chaves `tjlist`, `myLoginDM` e quatro servidores (`SERVER_1` a `SERVER_4`) | Até cinco endpoints configuráveis e listas privadas por usuário. |
| Home | `HomeActivity`, `homePageData`, banners e categorias | Home com destaques, filmes, séries, live e busca. |
| VOD | `VODEXTRA`, `VODMEDIA`, detalhes, álbuns e episódios | Catálogo, detalhes, temporadas, episódios e reprodução. |
| Live | `LivePlayer`, `LivePlayerVertical`, categorias, fontes e troca de canal | Lista de canais, fontes e player HLS/MP4. |
| EPG | `EPGMainActivity`, `EPGSingleChannelActivity`, atualização e grade | Programação por canal e horário. |
| Busca | `SearchActivity`, histórico, busca rápida e resultados | Busca local/remota com estados vazios. |
| Reprodução | Bibliotecas `ijkplayer`, `ijkffmpeg`, `ijksdl`, RTMP/HLS/TS e UDP | Interface de player substituível, iniciando por VideoView e evoluindo para Media3/ExoPlayer. |
| Configuração | servidor, idioma, decoder, autoplay, rede e aparência | Configuração própria sem credenciais hardcoded. |

## Limitações da análise estática

O APK contém o cliente e referências a serviços, mas o conteúdo de canais, filmes e séries não está armazenado dentro do arquivo. Ele é recebido em tempo de execução pelo backend/lista configurado. A decompilação confirmou nomes de chaves, telas e bibliotecas, mas não recuperou um contrato completo de JSON nem uma credencial de usuário.

A reconstrução correta, portanto, é um cliente Facilitus próprio que reproduz a experiência do NEXUS e usa a mesma classe de fontes de conteúdo somente quando autorizadas e configuradas. O NEXUS não será reempacotado como runtime, pois as tentativas anteriores provaram que o shell/Application protegido fecha após qualquer alteração de DEX, assinatura ou pacote.

## Critério de conclusão

A entrega final só será chamada de funcional quando o APK único abrir no aparelho, exibir a tela Facilitus, aceitar o identificador, autenticar no painel, carregar pelo menos uma lista real, separar canais/filmes/séries, abrir o player e exibir EPG ou um estado de ausência de EPG sem crash.
