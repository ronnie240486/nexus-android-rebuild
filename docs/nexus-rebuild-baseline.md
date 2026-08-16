# Linha de base da reconstrução do NEXUS para Facilitus

## Escopo confirmado

O APK original declara 76 Activities e contém layouts para entrada, login, Home, catálogo de vídeo, detalhes, temporadas e episódios, reprodução VOD, reprodução Live horizontal/vertical, EPG, busca, favoritos, histórico, conta, compras, aplicativos, WebView, artigos, reservas, esportes, arquivos, idioma, servidor e configurações. O objetivo da reconstrução é reproduzir esses fluxos em código próprio, sem reempacotar o shell protegido.

## Contrato observado no código original

Os nomes de dados mais importantes são `mac_di` para o identificador do dispositivo, `tjlist` e `myLoginDM` para listas/sessão, `homePageData` para a Home, `VODEXTRA` e `VODMEDIA` para dados de vídeo e `ServerAddress` para o servidor configurado. Os parâmetros de navegação incluem `tid`, `vid`, `index`, `VODEXTRA`, `VODMEDIA`, `VIDEODEAIL`, `VIDEOTYPE`, `VIDEOSUB` e `LABELTYPE`.

O APK registra referências a `api.52itv.cn/v`, `so.52itv.cn` e `so.api.52itv.cn`, além de quatro slots de servidor (`SERVER_1` a `SERVER_4`). O cliente próprio do Facilitus deverá manter esses valores como configuração, nunca como credenciais embutidas, e permitir a troca por painel autorizado.

## Funcionalidades que precisam de implementação própria

A primeira etapa deve reproduzir a entrada Facilitus com logo, boas-vindas e identificador de 12 dígitos copiável. Em seguida devem ser implementados autenticação/ativação, Home, categorias, catálogo VOD, detalhes e episódios, canais Live, player, EPG, busca, favoritos, histórico, listas privadas, configurações, conta, compras, esportes, WebView, artigos e reservas.

## Limitação técnica

O shell original contém carregamento protegido e referências fixas ao package `cn.dolit.nexus`. O APK modificado com os DEX originais e uma assinatura nova fecha após iniciar. Portanto, o runtime original é mantido somente como referência funcional; o Facilitus final deve ser compilado como um novo app, com navegação e cliente de dados próprios.
