# Artefatos forenses

Esta pasta contém evidências derivadas do APK original. Os arquivos foram gerados sem executar o aplicativo ou qualquer binário extraído dele.

| Arquivo | Finalidade |
|---|---|
| `aapt-badging.txt` | Identidade, SDK, atividades de lançamento, ABIs e recursos declarados. |
| `aapt-permissions.txt` | Permissões declaradas no manifesto. |
| `AndroidManifest.xml` | Manifesto decodificado pelo Apktool. |
| `manifest-components.txt` | Recorte organizado de atividades, serviços, receptores e provedores. |
| `dex-endpoints.txt` | URLs e domínios extraídos de strings legíveis dos DEX. |
| `network-constants.txt` | Referências em Java/smali a hosts, chaves e configurações relevantes. |
| `apktool.yml` | Metadados de decodificação e versão do Apktool. |
| `sha256sums.txt` | Hashes para verificar os artefatos preservados. |
| `icon-2L.png` | Ícone principal declarado pelo pacote. |

O APK está em `../apk/NEXUS.apk`. Como esses arquivos podem conter identificadores e endpoints históricos do fornecedor, este repositório permanece privado. Nenhuma credencial deve ser adicionada ao projeto.
