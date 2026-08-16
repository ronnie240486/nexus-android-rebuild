# Contrato da reconstrução completa do NEXUS para Facilitus TV

## Objetivo

O produto final deve ser um único aplicativo Android TV/TV Box chamado Facilitus, reconstruído a partir do APK anexado `nexus-original-0.2.12.apk`. Ele deve reproduzir os fluxos reais observados no original: entrada, ativação, Home, categorias, canais ao vivo, filmes, séries, detalhes, temporadas, episódios, player, EPG, busca, favoritos, histórico, listas, conta, login, compras, esportes, WebView, artigos, reservas, downloads, configurações e telas de suporte.

## Identidade e entrada

A entrada deve usar o logo Facilitus, mensagem de boas-vindas, paisagem e tela cheia. O identificador do aparelho será exibido como exatamente 12 dígitos, com ação de cópia para o painel. A Home somente será liberada quando o painel próprio responder que o aparelho está ativo; não deve existir botão de desbloqueio local e a mensagem `validation_fails` do NEXUS não deve aparecer.

## Streaming

O cliente deve carregar as playlists vinculadas ao aparelho, suportar até cinco listas com os campos `playlist_url` e `playlist_name`, categorizar itens Live/VOD/Séries, exibir capas e metadados, abrir detalhes e temporadas e iniciar reprodução HLS/MP4 com player adequado para controle remoto. O EPG deve ser associado ao canal e permitir navegação por data e horário.

## TV Box

O manifesto deve declarar a entrada Leanback opcional, não exigir touchscreen, abrir em landscape/fullscreen e fornecer foco visual para todos os botões navegáveis via D-pad. O back do controle deve respeitar a pilha de navegação, e o player deve aceitar play/pause, voltar, seleção de áudio e troca de fonte quando disponíveis.

## Critério de aceite

Uma build não será chamada de completa se for apenas launcher, sonda, tela manual vazia ou reempacotamento do shell protegido. A entrega final precisa passar por teste de instalação limpa, abertura sem fechamento, ativação, carregamento de lista, navegação por canais/filmes/séries, reprodução de ao menos um item autorizado e retorno pela tecla Back.

## Limitação conhecida

O APK original contém shell protegido e a chave privada de assinatura não foi fornecida. Portanto, a reconstrução funcional deve ser código próprio; alterações binárias no APK original não são uma rota de entrega confiável. O anexo continua sendo a fonte visual e funcional, enquanto o runtime final é compilado separadamente.
