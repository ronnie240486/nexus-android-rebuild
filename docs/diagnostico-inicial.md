# Diagnóstico inicial do APK NEXUS

**Data da análise:** 15 de agosto de 2026.  
**Artefato analisado:** `NEXUS.apk`.  
**Pacote:** `cn.dolit.nexus`.  
**Versão identificada:** `versionName=0.2.12`, `versionCode=212`.

## Resumo executivo

O NEXUS é um aplicativo Android orientado a **conteúdo audiovisual e operação em Android TV**, com suporte a canais ao vivo, EPG, vídeo sob demanda, favoritos, busca, compras/pacotes, anúncios, WebView, atualização remota e reprodução multimídia. O pacote também incorpora bibliotecas nativas de streaming, FFmpeg/IJKPlayer, transporte P2P e um cliente MQTT.

A maior conclusão técnica é que o APK não é uma base adequada para evolução direta. O código está fortemente ofuscado e, em diversas classes importantes, a decompilação Java perdeu o corpo dos métodos ou gerou retornos artificiais. A estratégia mais segura é manter o APK como evidência de comportamento e iniciar uma **reconstrução limpa por módulos**, validando cada fluxo contra o comportamento autorizado que desejamos preservar.

## Identidade e empacotamento

| Item | Resultado |
|---|---|
| Pacote | `cn.dolit.nexus` |
| Nome exibido | `NEXUS` |
| `versionCode` | `212` |
| `versionName` | `0.2.12` |
| SDK mínimo | 19 |
| SDK alvo | 34 |
| Arquivos DEX | 4 (`classes.dex` até `classes4.dex`) |
| ABIs nativas | `arm64-v8a` e `armeabi-v7a` |
| Tamanho do APK | 37.071.861 bytes |
| Integridade ZIP | válida |
| Assinatura | `META-INF/OTTCLIEN.RSA` / certificado autoassinado `O=dolit, OU=dolit` |

Os dados de identidade e compatibilidade foram extraídos do inventário de empacotamento [1]. A assinatura não deve ser reutilizada na nova implementação; o rebuild terá uma chave própria e precisará de um novo ciclo de instalação/atualização.

## Componentes Android observados

A tela de entrada declarada é `android.media.ViviTV.Pre_launcher`, com suporte a lançamento normal e leanback. O conjunto de atividades aponta para uma aplicação ampla, com módulos de login, cadastro, home, busca, canais, EPG, player ao vivo, player VOD, favoritos, conteúdo personalizado, compras, WebView, arquivos/USB e configurações.

| Área | Evidência no manifesto |
|---|---|
| Inicialização | `Pre_launcher`, `BootCompletedReceiver` |
| Conteúdo | `HomeActivity`, `VideoAlbumActivity`, `VideoDetails*`, `Label*`, `SubjectAlbumActivity` |
| TV ao vivo | `LivePlayer`, `LivePlayerVertical`, `EPGMainActivity`, `EPGSingleChannelActivity` |
| Vídeo sob demanda | `VodPlayer`, `VideoPlayActivity`, `VideoSummaryActivity` |
| Conta | `LoginActivity`, `LoginLandActivity`, `RegisterActivity`, `ForgetPwdActivity`, `UserRegisterActivity` |
| Comércio | `PurchaseActivity`, `PurchaseListActivityPortrait`, `PackagePurchaseActivity`, `ScanPurchaseActivity` |
| Sistema/integrações | `ServerAddressSettingActivity`, `SettingFragmentActivity`, `WebViewCommActivity`, atividades X5 WebView |
| Segundo plano | `MainService`, `TaskService`, `ExtraService`, `AdsHttpService`, `UpdateService`, `MqttService` |
| Eventos do sistema | instalação/remoção de pacotes e `BOOT_COMPLETED` |

A relação completa foi preservada em [2]. Há receptores exportados para eventos de boot e de alteração de pacotes; isso deve ser revisado no rebuild, porque funcionalidades em segundo plano precisam ser justificadas e limitadas ao mínimo necessário.

## Permissões e superfície de risco

O APK declara permissões de rede, câmera, estado de telefonia, armazenamento, Wi-Fi, boot, wake lock, instalação de pacotes, janela sobre outros aplicativos, consulta de todos os pacotes e leitura de mídia. Também aparecem permissões privilegiadas ou historicamente sensíveis, como `READ_PRIVILEGED_PHONE_STATE`, `SET_TIME`, `SHUTDOWN`, `DEVICE_POWER`, `READ_LOGS` e `RESTART_PACKAGES`.

| Grupo | Permissões observadas | Prioridade de revisão |
|---|---|---|
| Rede e conectividade | `INTERNET`, estado de rede/Wi-Fi e mudanças de rede/Wi-Fi | Manter somente as necessárias e preferir TLS. |
| Mídia e arquivos | armazenamento legado e `READ_MEDIA_*` | Migrar para Storage Access Framework/MediaStore conforme o fluxo. |
| Identidade do dispositivo | `READ_PHONE_STATE`, `READ_PRIVILEGED_PHONE_STATE` | Remover, salvo requisito documentado e autorizado. |
| Sistema | boot, wake lock, ajuste de hora, shutdown, device power, logs | Remover da versão limpa ou isolar em dispositivo dedicado com justificativa. |
| Instalação e controle | `REQUEST_INSTALL_PACKAGES`, `SYSTEM_ALERT_WINDOW`, `QUERY_ALL_PACKAGES` | Tratar como alto risco; eliminar por padrão. |
| Câmera | `CAMERA` | Solicitar somente na tela/fluxo que realmente usa câmera. |

A lista original está em [3]. A presença de uma permissão no manifesto não prova que ela seja usada em runtime, mas é suficiente para torná-la uma prioridade de auditoria.

## Rede, endpoints e integrações

Foram encontrados hosts e URLs legados tanto no bytecode quanto no código decompilado. Os achados precisam ser classificados como **produção, teste, fallback ou dependência de terceiros** antes de qualquer migração.

| Achado | Classificação preliminar | Ação recomendada |
|---|---|---|
| `api.52itv.cn/v`, `so.52itv.cn`, `so.api.52itv.cn` | Constantes ligadas ao contrato principal do app | Substituir por configuração externa e contrato versionado. |
| `mqtt.ott-iptv.net:1883` | Broker MQTT em porta sem TLS | Migrar para MQTT sobre TLS ou remover se não for necessário. |
| `http://update.flvurl.cn/.../update.json` | Atualização remota via HTTP | Bloquear HTTP, assinar manifestos de atualização e usar HTTPS. |
| `https://cms.tvapp.nexus/` | Host de CMS/configuração | Confirmar propriedade, autenticação e finalidade. |
| `http://10.0.0.20/...` | Endpoints de teste de player | Remover completamente da build de produção. |
| `weather.com.cn`, URLs de documentação e domínios de bibliotecas | Dependências ou exemplos | Não tratar automaticamente como backend do produto. |

Os endpoints foram extraídos de [4] e [5]. O aplicativo também contém componentes de atualização, anúncios, WebView e analytics/Crashlytics; cada integração deverá ganhar um adaptador explícito e uma política de privacidade antes de entrar no rebuild.

## Módulos e recursos visuais

A decodificação revelou aproximadamente 1.533 arquivos XML de recursos, 1.169 imagens e 52 assets. Os nomes de layout indicam uma interface originalmente construída para orientação horizontal e vertical, com foco em navegação por controle remoto, listas horizontais, carrosséis, posters, banners, EPG e telas de player.

O ícone principal declarado pelo manifesto é `res/2L.png`, um símbolo abstrato em azul/turquesa sobre fundo escuro. A cópia visual preservada está em [6]. A nova identidade pode manter o reconhecimento do NEXUS, mas deve melhorar legibilidade em launcher, contraste, estados de foco e escalabilidade para TV.

## Qualidade da decompilação

A decompilação Java foi útil para inventário de classes, nomes de telas, constantes e modelos, mas não é uma fonte confiável para execução. Em `Pre_launcher`, `MainApp` e `ServerAddressSettingActivity`, por exemplo, há métodos substituídos por corpos vazios, `return null`, `return false` ou exceções de não decompilação. O smali também contém trechos com `return-void` e `nop` que exigem validação adicional antes de serem interpretados como comportamento original.

Consequentemente, o rebuild deve seguir três camadas: primeiro, um **catálogo de comportamento observado**; depois, contratos de dados e fluxos testáveis; por fim, uma implementação nova. Não é recomendável copiar mecanicamente o Java decompilado para um projeto Android.

## Prioridades de melhoria

A ordem sugerida é deliberadamente conservadora. Primeiro, devemos eliminar dependências e permissões desnecessárias e tornar a configuração de backend segura. Em seguida, devemos estabilizar o shell de TV, navegação por foco, login, catálogo, player e tratamento de estados offline. Só depois faz sentido reintroduzir anúncios, compras, atualização remota ou integrações de terceiros.

| Prioridade | Entrega | Critério de aceite |
|---|---|---|
| P0 | Base Android limpa e configuração por ambiente | Build reproduzível sem hosts/chaves hardcoded. |
| P0 | Auditoria de permissões e componentes exportados | Manifesto mínimo, sem receptores/serviços sem justificativa. |
| P1 | Navegação de TV e design system | Foco visível, back consistente, suporte a landscape/portrait conforme escopo. |
| P1 | Cliente de conteúdo e estados offline | Timeout, retry, cache, mensagens claras e logs sem dados sensíveis. |
| P1 | Player HLS/HTTP(S) | Reprodução, troca de qualidade, erro recuperável e encerramento correto. |
| P2 | Conta, favoritos e histórico | Contratos documentados e armazenamento seguro. |
| P2 | EPG, busca e catálogo | Paginação, acessibilidade e desempenho aceitável. |
| P3 | Atualização, anúncios e compras | Apenas após validação de segurança, propriedade e necessidade. |

## Referências locais

[1]: ../forensics/metadata/aapt-badging.txt "Metadados do pacote extraídos com AAPT"
[2]: ../forensics/metadata/manifest-components.txt "Componentes do manifesto"
[3]: ../forensics/metadata/aapt-permissions.txt "Permissões declaradas"
[4]: ../forensics/metadata/dex-endpoints.txt "Endpoints encontrados no bytecode"
[5]: ../forensics/metadata/network-constants.txt "Constantes de rede e configuração"
[6]: ../forensics/metadata/icon-2L.png "Ícone principal extraído"
