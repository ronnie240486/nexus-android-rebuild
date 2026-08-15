# Facilitus manual 0.3.0

Esta build é uma reconstrução manual em base Android própria, usando o APK original como referência de telas, nomenclatura e fluxos. Ela não carrega os DEX, o `Application` ou as bibliotecas do NEXUS.

## Módulos disponíveis nesta fatia

A tela inicial mostra o logo Facilitus, a mensagem de boas-vindas, o identificador do aparelho e o fluxo de cópia para o painel. Depois da confirmação local de ativação, a Home apresenta Filmes, Séries e episódios, Canais ao vivo, EPG, Busca, Favoritos, Minhas listas, Login e conta, Servidor, Aplicativos recomendados, Compras e recargas, Eventos esportivos, Web e artigos, Reservas, Downloads, Customização, Configurações e Sobre.

As telas possuem navegação, botões, estados vazios, mensagens e contratos locais. Dados reais, login, listas, EPG, imagens, reprodução, pagamentos, WebView e autorização ainda precisam ser ligados ao painel/backend autorizado; a build não inventa endpoints nem credenciais.

## Validação

A build foi compilada com `compileSdk 34`, `minSdk 23`, alinhada, assinada e verificada com `apksigner`, `zipalign` e `unzip -tq`. O ambiente não possui um Poco X7 Pro conectado, portanto o teste físico precisa ser feito no aparelho. Esta entrega é uma etapa funcional da recriação, não uma afirmação de que todos os dados do NEXUS já foram migrados.
