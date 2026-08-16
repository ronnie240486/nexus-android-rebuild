# Facilitus 0.6.0 — reconstrução própria de streaming

Esta build é um novo aplicativo Android compilado em `com.facilitus.app`, sem reempacotar o shell protegido do NEXUS. A interface reproduz os fluxos principais observados no inventário: entrada/ativação, Home, Filmes, Séries, Canais ao vivo, EPG, Busca, Favoritos, Minhas listas, Conta, Servidor, Aplicativos, Compras, Esportes, Web/Artigos, Reservas, Downloads, Customização, Configurações e Sobre.

A entrada mostra o identificador numérico de 12 dígitos do aparelho e permite copiá-lo. O botão de verificação consulta `API do Servidor/activation/validate?device_id=...`; somente uma resposta autorizada libera a Home. A aplicação não mantém desbloqueio local.

A tela Minhas listas suporta até cinco playlists privadas. O painel pode fornecer JSON usando os campos `playlist_url` e `playlist_name`; o usuário pode colar essa resposta para importar os slots. Cada playlist pode ser sincronizada separadamente. Após sincronizar, os itens reais são mostrados em Canais, Filmes, Séries e Busca; cada item abre o VideoView com a URL correspondente. O player depende de URLs HLS/MP4 válidas e autorizadas.

A build foi compilada, alinhada, assinada e verificada estaticamente. Como não há um Poco X7 Pro conectado ao sandbox, o teste físico ainda deve ser realizado no aparelho.
