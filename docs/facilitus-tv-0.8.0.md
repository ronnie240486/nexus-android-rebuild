# Facilitus TV 0.8.0

Esta build resolve a duplicidade de aplicativos na TV Box. O package de instalação foi definido como `cn.dolit.nexus`, o mesmo identificador do NEXUS antigo, mas o runtime desta build é o código próprio `com.facilitus.app.MainActivity` e o nome visível é Facilitus. Assim, depois de remover o APK antigo, a TV Box terá somente um aplicativo associado ao package.

A build foi feita para Android TV/TV Box: paisagem, tela cheia, Leanback opcional, touchscreen não obrigatório e botões focáveis para controle remoto. Ela não executa o shell protegido nem a validação legada que mostrava “Falha de validação”. A validação é feita pela API própria do painel Facilitus; as playlists são importadas com `playlist_url` e `playlist_name` e sincronizadas em até cinco slots.

Como a assinatura desta build não é a assinatura privada do NEXUS original, é obrigatório desinstalar o NEXUS antigo antes da instalação. Depois disso, o package não será instalado junto com o antigo e o atalho deverá apontar para a Activity própria do Facilitus.
