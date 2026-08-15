# Identidade visual do Facilitus

## Direção visual

A nova marca abandona o símbolo anterior do NEXUS e adota um ícone abstrato que combina a letra **F** com um elemento de reprodução. O resultado foi pensado para funcionar em launcher de TV, celular, splash screen e telas de conteúdo.

| Elemento | Definição |
|---|---|
| Nome de produto | Facilitus |
| Slug | `facilitus` |
| Pacote proposto para a reconstrução | `com.facilitus.app` |
| Fundo principal | Midnight navy, aproximadamente `#05082B` |
| Cor de ação | Cyan/turquesa elétrico, aproximadamente `#12D9E4` |
| Acento | Dourado quente, aproximadamente `#F2B63D` |
| Símbolo | F abstrato com triângulo de play |
| Tipografia do wordmark | Sans-serif geométrica, caixa alta, espaçamento amplo |

## Arquivos

| Arquivo | Uso |
|---|---|
| `assets/branding/facilitus-icon-final.png` | Master visual do ícone quadrado. |
| `assets/branding/facilitus-logo-final.png` | Master visual do logo horizontal. |
| `app-reconstruction/src/main/res/mipmap/facilitus_launcher.png` | Cópia destinada ao launcher da futura build. |
| `app-reconstruction/src/main/res/drawable/facilitus_wordmark.png` | Cópia destinada a splash, login e telas institucionais. |

Os arquivos de referência visual do APK antigo continuam em `forensics/metadata/` e não devem ser usados pela nova interface. O código forense permanece com o nome NEXUS porque documenta o pacote original; a reconstrução usa Facilitus e um novo identificador de pacote.

## Aplicação da marca

A tela de abertura deve exibir o wordmark por tempo curto e não deve bloquear a validação do MAC. Depois do splash, usuários não ativados devem ver somente a tela de ativação; usuários ativos podem seguir para a Home. O launcher deve usar o ícone quadrado e a interface deve respeitar contraste e foco visível para navegação por controle remoto.
