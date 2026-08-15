# Facilitus Legacy 0.2.12

Esta é a build do **Facilitus baseada no APK NEXUS original**, e não a shell mínima da versão 0.1.0. O rebuild preserva os quatro DEX originais, bibliotecas nativas, recursos, atividades, player, telas de catálogo, login, configurações e integrações já presentes no pacote. Uma quinta DEX contém apenas a nova tela de entrada `FacilitusGateActivity`.

| Item | Valor |
|---|---|
| Arquivo recomendado | `dist/facilitus-legacy-0.2.12-crashfix2.apk` |
| Pacote | `cn.dolit.nexus` — mantido para compatibilidade com o shell legado |
| Versão herdada | `0.2.12` / código `212` |
| Entrada | `android.media.ViviTV.FacilitusGateActivity` |
| Destino legado | `android.media.ViviTV.Pre_launcher` |
| Identidade | Facilitus, novo ícone e wordmark |
| DEX | Quatro DEX reconstruídos; a GateActivity foi inserida no DEX primário no crashfix2 |

## Fluxo do usuário

Ao abrir o APK, a primeira tela exibe o logo centralizado e a mensagem **“Bem-vindo ao Facilitus”**. O aplicativo lê o endereço físico de uma interface de rede do próprio aparelho, priorizando `eth0`, `wlan0`, `en0` e `lan0`, e mostra o valor em formato `XX:XX:XX:XX:XX:XX`.

O usuário toca em **Copiar MAC para o painel**, cola o código no painel e vincula a lista ao usuário. Depois toca em **Continuar para o aplicativo**. A tela encaminha para o `Pre_launcher` original, que permanece responsável pelo fluxo antigo de acesso, catálogo, player e demais módulos. O botão **Atualizar MAC** relê o endereço do aparelho. Se o sistema Android ocultar o endereço físico, a tela informa que o MAC está indisponível em vez de inventar um identificador.

> A tela não gera MAC aleatório e não substitui o MAC por Android ID. Em Android moderno, a disponibilidade do endereço físico depende do fabricante, da versão do sistema e do tipo de interface de rede. O painel continua sendo o responsável por associar esse código à lista do usuário.

## Reconstrução

O APK original tinha um recurso JPEG armazenado com extensão `.png` e nomes de recursos gerados com `$`, que impediam a recompilação direta. `scripts/normalize_legacy_resources.py` normaliza esses recursos antes do build; `scripts/patch_legacy_facilitus.py` altera somente pacote, marca e filtros de launcher, mantendo os componentes legados.

A build crashfix2 foi alinhada, assinada com certificado próprio do Facilitus e verificada com AAPT2 e `apksigner`. Após o relato de fechamento imediato, o crashfix2 manteve o pacote original e colocou a GateActivity no DEX primário, reduzindo a dependência do carregador multidex do shell. Não foi possível executar instalação em um dispositivo real no sandbox porque não havia aparelho conectado via ADB; a validação disponível é estática e de integridade do APK.
