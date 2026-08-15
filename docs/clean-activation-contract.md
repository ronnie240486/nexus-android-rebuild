# Contrato de ativação da base limpa

## Fluxo

A primeira tela lê o identificador do aparelho e exibe o valor em formato copiável. O operador copia esse valor para o painel, cadastra o usuário e vincula uma ou mais listas. A aplicação limpa deverá consultar o painel antes de liberar conteúdo real.

| Campo | Descrição |
|---|---|
| `device_id` | Valor copiado pelo usuário; MAC sem separadores quando disponível, ou código persistente de fallback. |
| `device_id_source` | `network_mac` ou `persistent_android_id`. |
| `user_id` | Identificador do usuário criado no painel. |
| `status` | `ACTIVE`, `PENDING`, `INACTIVE` ou `REVOKED`. |
| `lists` | Lista de objetos com `playlist_url` e `playlist_name`. |

## Exemplo de resposta do painel

```json
{
  "device_id": "A1B2C3D4E5F6",
  "status": "ACTIVE",
  "user_id": "user-001",
  "lists": [
    {
      "playlist_url": "https://homologacao.example.invalid/playlist.m3u8",
      "playlist_name": "Lista principal"
    }
  ]
}
```

A base não incluirá endpoint, token ou DNS de produção até que o painel autorizado seja fornecido. Sem backend configurado, a aplicação permanece em modo offline e mostra o shell de demonstração; ela não inventa autorização nem tenta acessar hosts descobertos no APK antigo.
