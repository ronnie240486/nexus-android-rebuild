# App reconstruction

A implementação compilável do **Facilitus** será criada nesta pasta. O APK original continua documentado em `forensics/` como referência histórica; a nova implementação não deve importar classes do pacote `cn.dolit.nexus` nem depender do Java decompilado.

O pacote proposto para a reconstrução é `com.facilitus.app`. A entrada da aplicação passa por uma tela de ativação: sem um MAC numérico válido de 12 dígitos e sem resposta `ACTIVE` do backend autorizado, a Home não deve abrir.

## Princípios iniciais

A base deverá separar apresentação, domínio, dados e integrações externas. Configurações de ambiente serão injetadas em build time ou fornecidas por uma configuração autenticada; nenhuma chave privada ou endpoint de produção ficará hardcoded. O player, o cliente HTTP, o armazenamento local e os serviços de fundo terão interfaces próprias para permitir testes e substituição.

A primeira versão deve funcionar com dados mockados, oferecer estados de loading/empty/error e ser navegável por D-pad. Recursos sensíveis, como atualização de APK, anúncios, compras, WebView e MQTT, ficam desativados até serem justificados e auditados.
