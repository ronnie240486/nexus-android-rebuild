# Facilitus Clean 0.2.0

Esta é a primeira build do **Facilitus reconstruída em uma base Android limpa**. Ela não carrega o `Application`, o shell protegido, os DEX ou as bibliotecas nativas do APK NEXUS. O objetivo deste marco é eliminar o crash estrutural e estabelecer uma entrada estável para as próximas funcionalidades.

| Item | Valor |
|---|---|
| Arquivo | `dist/facilitus-clean-0.2.0.apk` |
| Pacote | `com.facilitus.app` |
| Versão | `0.2.0` / código `2` |
| SDK mínimo | `23` |
| SDK alvo | `35` |
| Entrada | `com.facilitus.app.MainActivity` |
| Assinatura | RSA 4096-bit, certificado Facilitus |
| SHA-256 | Ver `dist/facilitus-clean-0.2.0.sha256` |

## Primeira tela

A aplicação abre em uma tela offline com o novo wordmark, a mensagem **“Bem-vindo ao Facilitus”**, o identificador do aparelho e o botão **“Copiar identificador”**. O código copiado deve ser colado no painel para cadastrar o usuário e vincular a lista. O botão **“Continuar”** abre uma Home de demonstração sem rede, com entradas para Filmes, Séries, Canais ao vivo, Minhas listas e Configurações.

Quando o sistema permite a leitura de uma interface de rede, o valor apresentado é o MAC sem separadores. Quando o Android ou o fabricante ocultam o MAC físico, a aplicação usa um identificador persistente derivado do Android ID e informa essa origem na tela. O app não gera um valor aleatório a cada abertura e não depende do shell legado.

## Estado dos módulos

A Home atual é um shell offline. Os módulos visuais são pontos de entrada para a implementação incremental de catálogo, listas, player, EPG, busca e configurações. Nenhum endpoint de produção, DNS, token ou credencial foi embutido. A integração real depende do painel autorizado e seguirá o contrato em `docs/clean-activation-contract.md`.

## Validação

A build foi compilada com Gradle, alinhada com `zipalign`, assinada com `apksigner` e verificada com AAPT2. Não havia dispositivo Android conectado ao sandbox para executar uma instalação via ADB; portanto, a validação disponível é de compilação, integridade, manifesto e assinatura. Diferentemente das versões baseadas no APK antigo, esta build não reutiliza o shell que provocava o fechamento imediato.
