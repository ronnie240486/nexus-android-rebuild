# Facilitus TV Complete 0.9.0

Esta build tem 36.970.961 bytes e usa como fonte oficial o `nexus-original-0.2.12.apk` anexado pelo usuário. Ela inclui os assets e as bibliotecas nativas de reprodução do anexo, roda em landscape/fullscreen para TV Box, oferece foco D-pad, identificador de 12 dígitos, ativação própria, até cinco playlists M3U, player HLS/MP4 e sincronização XMLTV para EPG.

O package de instalação é `cn.dolit.nexus` para impedir a coexistência confusa com o APK antigo; a Activity inicial é `com.facilitus.app.MainActivity`, com nome visível Facilitus. A instalação exige remover o NEXUS antigo, pois a chave de assinatura é diferente.

Os assets, DEX e bibliotecas do original ficam armazenados no projeto como referência. O shell protegido original não é executado; a implementação própria precisa continuar recebendo os módulos em código próprio para evitar a validação legada e o fechamento observado.
