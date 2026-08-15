# Facilitus Android Rebuild

Repositório privado para a reconstrução incremental do aplicativo **Facilitus**, criado a partir da análise forense do APK original **NEXUS** fornecido no projeto. O objetivo é transformar um pacote Android fechado e parcialmente ofuscado em uma base de manutenção controlável, com separação entre evidências do APK original, código decompilado e uma futura implementação limpa.

> **Nova identidade:** o produto reconstruído usa o nome Facilitus, o pacote proposto `com.facilitus.app`, novo ícone/logo e ativação obrigatória por MAC numérico exclusivo de 12 dígitos.

> **Estado atual:** build completa crashfix2 disponível em `dist/facilitus-legacy-0.2.12-crashfix2.apk`; ela preserva os módulos legados, mantém o pacote compatível com o shell original e inicia pela tela Facilitus de MAC. A associação da lista continua sendo feita no painel.

## Escopo

O projeto registra a identidade técnica do pacote `cn.dolit.nexus`, seus componentes Android, permissões, bibliotecas nativas, recursos, pontos de integração externa e limitações da decompilação. O APK original é mantido apenas como artefato de referência dentro do repositório privado; ele não deve ser redistribuído publicamente.

A abordagem recomendada é **reimplementar por comportamento**, em vez de tentar editar indefinidamente o bytecode ofuscado. A primeira etapa de melhoria deve estabilizar configuração de servidor, rede, navegação e reprodução de mídia; em seguida, devemos remover permissões excessivas, substituir endpoints legados e modernizar a arquitetura.

## Estrutura

| Diretório | Conteúdo |
|---|---|
| `docs/` | Diagnóstico, mapa funcional, riscos e roadmap de melhoria. |
| `forensics/metadata/` | Manifesto, badging, permissões, hashes e inventário extraídos do APK. |
| `forensics/decompiled/` | Código Java decompilado e recursos decodificados, preservados como referência. |
| `forensics/smali/` | Bytecode smali usado quando o Java decompilado perdeu blocos de controle. |
| `app-reconstruction/` | Espaço reservado para a implementação limpa e compilável. |
| `scripts/` | Scripts reproduzíveis de análise e verificação. |

## Limitações conhecidas

O pacote contém quatro arquivos DEX, código nativo para `arm64-v8a` e `armeabi-v7a`, muitas dependências incorporadas e sinais de ofuscação. Em classes relevantes, o decompilador produziu métodos vazios, retornos artificiais ou `UnsupportedOperationException`; por isso, os arquivos decompilados não devem ser tratados como fonte original nem compilados diretamente.

A assinatura encontrada usa um certificado autoassinado com sujeito e emissor `O=dolit, OU=dolit`. Qualquer APK reconstruído precisará de uma nova chave de assinatura e terá um identificador de assinatura diferente do pacote distribuído originalmente.

## Próximo passo recomendado

Antes de alterar telas, devemos definir o contrato funcional desejado: fontes de conteúdo, formato de configuração de servidores, autenticação, reprodução ao vivo/VOD, anúncios, atualização e suporte a Android TV. Depois disso, a base limpa será criada com módulos testáveis e configuração externa segura, sem chaves ou hosts hardcoded.

## Uso responsável

Este repositório deve ser usado somente para manutenção, interoperabilidade e evolução autorizada do software. Não serão adicionadas credenciais reais, mecanismos de bypass de licença, coleta indevida de dados ou funcionalidades que afetem dispositivos sem consentimento.
