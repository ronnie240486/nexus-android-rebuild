# Facilitus TV Complete 0.9.0

Esta build usa como fonte oficial o arquivo anexado `nexus-original-0.2.12.apk`, SHA-256 `5e0738de866acc4c14e8a0e11e8e82a0fad9b4ce30113363c30026ae747d8197`. Ela inclui no pacote os assets, DEX de referência e as bibliotecas nativas IJK/FFmpeg/P2P do anexo, além do runtime próprio Facilitus para Android TV/TV Box.

O APK tem 36.970.961 bytes, próximo do original, package `cn.dolit.nexus`, nome visível Facilitus, entrada própria `com.facilitus.app.MainActivity`, paisagem, tela cheia, Leanback opcional, controle D-pad, identificador de 12 dígitos, ativação própria, até cinco playlists, parser M3U e player HLS/MP4.

Os DEX e assets originais estão armazenados em `assets/original-source` para referência e preservação; eles não são executados como o shell protegido, pois a assinatura privada original não foi fornecida. O contrato de aceite exige que a implementação própria seja concluída e testada antes de ser considerada equivalente a todas as 76 Activities do anexo.
