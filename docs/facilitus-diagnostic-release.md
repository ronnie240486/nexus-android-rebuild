# Facilitus Diagnostic 0.2.12

Esta build existe para capturar o erro de inicialização que fazia o APK fechar rapidamente. O `CrashHandler` é instalado no início do `Application` legado e intercepta exceções não tratadas. O relatório é salvo localmente e abre a `CrashReporterActivity`.

Quando ocorrer um erro, a tela mostra **Diagnóstico do Facilitus**, a versão do Android, fabricante/modelo, thread, classe da exceção e stack trace. O botão **Copiar relatório** coloca todo o texto na área de transferência. O usuário pode colar o conteúdo em uma mensagem para permitir a correção precisa. O botão **Tentar abrir novamente** volta para a GateActivity.

| Item | Valor |
|---|---|
| Arquivo | `dist/facilitus-legacy-0.2.12-diagnostic.apk` |
| Pacote | `cn.dolit.nexus`, preservado para compatibilidade do shell original |
| Entrada | `android.media.ViviTV.FacilitusGateActivity` |
| Relatório | Persistido em SharedPreferences com a chave `last_crash` |
| Assinatura | RSA 4096-bit, certificado Facilitus |
| SHA-256 | Ver `dist/facilitus-legacy-0.2.12-diagnostic.sha256` |

O diagnóstico é uma build de investigação. Depois de obter o relatório, a exceção deve ser corrigida e uma build normal deve ser gerada sem depender da tela de diagnóstico.
