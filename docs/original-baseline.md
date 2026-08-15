# Baseline do NEXUS original

O arquivo `/home/ubuntu/upload/NEXUS.apk` será tratado como fonte de referência imutável. A reconstrução nova não fará patch no pacote original, não trocará o `Application` protegido e não tentará mudar o package name dentro dos DEX legados.

O objetivo é preservar comportamento por contrato: entrada, configuração de servidor, login, listas, catálogo, player, EPG, busca, favoritos, configurações e integrações autorizadas serão reimplementados em módulos Android limpos. Endpoints, chaves, anúncios, MQTT, atualização remota e permissões excessivas não serão copiados sem validação.

O dispositivo de teste informado é um Poco X7 Pro. O APK novo terá `minSdk` compatível com a versão Android do aparelho, um `applicationId` próprio e somente componentes necessários no manifesto.
