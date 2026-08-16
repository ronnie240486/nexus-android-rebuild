# Facilitus 0.5.0 — reconstrução própria

Esta versão é um novo aplicativo Android com package `com.facilitus.app`. Ela não reempacota o shell protegido do NEXUS. A interface própria reproduz os fluxos principais observados no inventário: boas-vindas/ativação, Home, Filmes, Séries, Canais ao vivo, EPG, Busca, Favoritos, Minhas listas, Login/Conta, Servidor, Aplicativos, Compras, Esportes, Web/Artigos, Reservas, Downloads, Customização, Configurações e Sobre.

A sincronização aceita uma URL M3U autorizada cadastrada em Servidor 1. Os itens reais recebidos são exibidos em Canais, Filmes, Séries e Busca, e cada item abre o VideoView com a URL correspondente. Sem uma lista configurada, a build mostra estados vazios e instruções; ela não inventa catálogo.

O identificador do aparelho é exibido como valor de ativação no formato de 12 dígitos. A unicidade e a liberação da lista devem ser garantidas pelo painel autorizado. A build foi compilada, alinhada, assinada e verificada estaticamente. O teste físico no Poco X7 Pro ainda precisa ser feito fora do sandbox.
