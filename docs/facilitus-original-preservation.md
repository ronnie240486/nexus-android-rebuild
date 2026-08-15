# Facilitus sobre o NEXUS original

O arquivo `dist/nexus-original-0.2.12.apk` é uma cópia byte a byte do NEXUS.apk recebido. O SHA-256 permanece `5e0738de866acc4c14e8a0e11e8e82a0fad9b4ce30113363c30026ae747d8197`.

O arquivo `dist/facilitus-launcher-0.2.0.apk` é uma camada separada com a marca Facilitus. Ela exibe o logo, mensagem de boas-vindas, identificador do aparelho e botão de cópia para o painel. O botão **Abrir aplicativo original** procura o pacote `cn.dolit.nexus` instalado e abre o launcher original, sem tocar nos DEX, bibliotecas, manifesto ou recursos do NEXUS.

## Instalação desta etapa

Primeiro instale `nexus-original-0.2.12.apk`. Depois instale `facilitus-launcher-0.2.0.apk`. Abra o Facilitus Launcher, copie o identificador para o painel e use **Abrir aplicativo original** para entrar no aplicativo completo.

Esta é uma etapa de preservação, não uma fusão final em um único APK. A fusão direta foi descartada porque recompilar ou alterar o shell protegido fazia o processo fechar antes de qualquer Activity renderizar. Para entregar um único APK com todos os módulos, será necessário reimplementar o shell e os módulos do original em uma base controlada, ou obter a fonte/assinatura de distribuição autorizada do aplicativo original.
