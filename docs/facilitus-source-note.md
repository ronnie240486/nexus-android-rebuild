# Fonte da reconstrução Facilitus

A fonte oficial desta etapa é o arquivo anexado pelo usuário `nexus-original-0.2.12.apk`, SHA-256 `5e0738de866acc4c14e8a0e11e8e82a0fad9b4ce30113363c30026ae747d8197`. O inventário confirmado contém 76 Activities, 487 layouts, 1.591 drawables, 103 mipmaps, 71 bibliotecas nativas, quatro DEX e entrada Leanback em paisagem.

O shell protegido do original usa `s.h.e.l.l.S` e a rotina de validação legada fecha o aplicativo quando a assinatura original não está presente. Por esse motivo, o Facilitus TV é compilado como runtime próprio baseado no inventário do anexo, não como um segundo launcher nem como uma alteração binária que reutiliza a proteção quebrada.
