# App reconstruction

A implementação compilável do NEXUS será criada nesta pasta depois que o contrato de produto for confirmado. Ela não deve importar classes do pacote `cn.dolit.nexus` nem depender do Java decompilado.

## Princípios iniciais

A base deverá separar apresentação, domínio, dados e integrações externas. Configurações de ambiente serão injetadas em build time ou fornecidas por uma configuração autenticada; nenhuma chave privada ou endpoint de produção ficará hardcoded. O player, o cliente HTTP, o armazenamento local e os serviços de fundo terão interfaces próprias para permitir testes e substituição.

A primeira versão deve funcionar com dados mockados, oferecer estados de loading/empty/error e ser navegável por D-pad. Recursos sensíveis, como atualização de APK, anúncios, compras, WebView e MQTT, ficam desativados até serem justificados e auditados.
