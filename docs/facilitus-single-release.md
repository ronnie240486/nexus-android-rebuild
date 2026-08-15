# Facilitus 0.2.12 — APK único baseado no NEXUS original

A build `dist/facilitus-0.2.12.apk` é um único APK derivado do `NEXUS.apk` recebido. O package continua `cn.dolit.nexus` para preservar o Application e o shell originais, mas o label do aplicativo foi alterado para `Facilitus`, o ícone aponta para o novo asset e a Activity original `android.media.ViviTV.Pre_launcher` chama a tela Facilitus antes de continuar o fluxo legado.

A tela inserida exibe o logo, a mensagem de boas-vindas, um identificador numérico de 12 dígitos derivado do MAC quando o Android disponibiliza o endereço de hardware e, quando o sistema oculta o MAC, do `ANDROID_ID`. O identificador pode ser copiado para o painel.

Os arquivos `classes2.dex`, `classes3.dex` e `classes4.dex` foram preservados byte a byte. O DEX primário foi remontado somente para adicionar a classe `WelcomeOverlay` e a chamada no `Pre_launcher`. As bibliotecas nativas, componentes do manifesto, recursos de conteúdo e o Application original foram mantidos.

## Validação

A build foi alinhada, assinada com uma nova chave de distribuição, verificada por `apksigner`, testada com `unzip -tq` e conferida com AAPT2. O ambiente de execução não possui um Poco X7 Pro conectado, portanto ainda não é possível afirmar a abertura real no aparelho. Se a proteção interna do shell verificar a assinatura original ou o checksum do DEX primário, o APK poderá fechar antes da tela; nesse caso, a solução será reimplementar o shell com fonte autorizada, não continuar alterando o bytecode protegido.
