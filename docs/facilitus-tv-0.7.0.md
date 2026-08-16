# Facilitus TV 0.7.0

Esta build é a versão Android TV/TV Box da reconstrução própria do Facilitus. Ela não executa o shell protegido do NEXUS e não contém a validação legada que exibia “Falha na validação”. O manifesto declara suporte opcional a Leanback, não exige touchscreen, entra em paisagem e usa tela cheia.

A interface foi ajustada para controle remoto: os botões são focáveis, têm foco visual ciano e tamanho maior. A entrada mostra o identificador numérico do aparelho, permite copiá-lo e valida o cadastro somente pela API do painel configurada em `API do Servidor`. A Home e os módulos usam as playlists autorizadas recebidas do painel; a tela Minhas listas suporta até cinco objetos com `playlist_url` e `playlist_name`.

O APK foi compilado com `com.facilitus.app`, versão `0.7.0`, alinhado, assinado e verificado com AAPT2, zipalign e apksigner. O teste físico deve ser realizado na TV Box; não há dispositivo Android TV conectado ao sandbox.
