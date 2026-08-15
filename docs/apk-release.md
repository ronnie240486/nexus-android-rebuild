# APK Facilitus 0.1.0

## Entrega

O arquivo `dist/facilitus-0.1.0.apk` é uma build release instalável do aplicativo reconstruído, com pacote `com.facilitus.app`, nome exibido `Facilitus`, novo ícone, novo wordmark e tela inicial de ativação por MAC.

| Item | Valor |
|---|---|
| Versão | `0.1.0` |
| Código da versão | `1` |
| Pacote | `com.facilitus.app` |
| SDK mínimo | 23 |
| SDK alvo | 35 |
| Permissão atual | `INTERNET` |
| Assinatura | RSA 4096-bit, certificado Facilitus próprio |
| SHA-256 | Ver `dist/facilitus-0.1.0.sha256` |

## Fluxo da primeira build

Ao abrir pela primeira vez, o aplicativo apresenta a tela **Ative o Facilitus**. O campo aceita somente 12 dígitos numéricos e rejeita valores com tamanho incorreto, letras ou `000000000000`. Depois da ativação demonstrativa, o MAC é salvo localmente e a Home inicial é exibida. O botão **Trocar MAC** limpa o estado local e retorna à tela de ativação.

Esta primeira build usa validação local para ser instalável e demonstrável sem um backend conectado. Para produção, o método `ActivationGate.Decision.fromBackend(...)` deve ser alimentado pela resposta HTTPS de `/activation/validate`; a unicidade do MAC por usuário, expiração, revogação e vínculo de dispositivo devem ser garantidos pelo servidor.

## Validação realizada

A build foi compilada com Gradle e Android Gradle Plugin, passou por `zipalign`, foi assinada com chave própria e verificada com `apksigner`. O manifesto foi conferido com AAPT2 e apresenta `Facilitus` e `com.facilitus.app`. Não havia dispositivo Android conectado ao ambiente para executar uma instalação via ADB; portanto, a validação foi estática e de build.

## Como instalar

Transfira o APK para o dispositivo Android, habilite a instalação da fonte utilizada conforme a política do dispositivo e abra `facilitus-0.1.0.apk`. Em Android TV, use um gerenciador de arquivos ou o mecanismo de instalação autorizado pelo equipamento.
