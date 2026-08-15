# Facilitus — ativação por MAC de 12 dígitos

## Regra de negócio

O aplicativo deve abrir a área principal somente depois que o usuário informar um **MAC numérico de exatamente 12 dígitos** e esse MAC for validado pelo serviço autorizado. Cada usuário deve possuir um MAC exclusivo no backend. O aplicativo não deve tentar garantir unicidade sozinho, porque uma regra local não impede que dois dispositivos recebam ou gerem o mesmo código.

> **Importante:** neste projeto, “MAC” é um identificador de ativação de 12 dígitos atribuído ao usuário. Ele não será obtido automaticamente do endereço MAC físico do Wi‑Fi. Em versões modernas do Android, o endereço físico pode ser aleatorizado, protegido ou indisponível; além disso, ele identifica uma interface/dispositivo, não uma conta de usuário.

## Formato aceito

| Regra | Comportamento |
|---|---|
| Comprimento | Aceitar somente 12 caracteres. |
| Conteúdo | Aceitar somente os dígitos `0` a `9`. |
| Valor vazio | Rejeitar. |
| Valor repetitivo | Rejeitar `000000000000`; outros códigos repetitivos continuam dependendo do backend. |
| Espaços e máscara | Remover espaços nas extremidades; não aceitar letras, hífens ou dois-pontos na primeira versão. |
| Persistência | Armazenar somente o MAC autorizado e o estado mínimo da sessão, nunca a senha do usuário. |
| Revalidação | Revalidar ao iniciar, quando a sessão expirar ou quando o backend solicitar. |

## Contrato sugerido

### Requisição

```json
{
  "mac": "123456789012",
  "app_id": "facilitus",
  "app_version": "0.1.0",
  "device_installation_id": "generated-installation-id"
}
```

### Resposta autorizada

```json
{
  "status": "ACTIVE",
  "user_id": "user-123",
  "mac": "123456789012",
  "device_binding": "BOUND",
  "expires_at": null,
  "display_name": "Usuário Facilitus"
}
```

### Respostas bloqueadas

O app deve manter o usuário na tela de ativação para `INVALID_FORMAT`, `NOT_FOUND`, `INACTIVE`, `EXPIRED`, `ALREADY_BOUND`, `DEVICE_MISMATCH` e `NETWORK_ERROR`. Em `NETWORK_ERROR`, deve existir uma mensagem clara e um botão de tentar novamente; não deve haver abertura silenciosa do conteúdo protegido.

## Garantia de unicidade

A tabela de usuários deve possuir uma restrição única no campo normalizado `mac`. A criação ou alteração do MAC deve ser uma operação transacional no painel/backend. O fluxo recomendado é gerar o MAC no servidor usando um CSPRNG, verificar colisão na transação e registrar auditoria de criação, alteração, revogação e vínculo de dispositivo.

Não se deve usar timestamp, contador local ou `Math.random()` para criar códigos de ativação. Também não se deve aceitar que o cliente escolha livremente um MAC durante o cadastro sem uma validação de unicidade no backend.

## Fluxo de abertura

```text
Splash Facilitus
      |
      v
Existe sessão local válida?
  | sim                    | não
  v                        v
Revalidar sessão       Tela “Digite seu MAC”
  |                      |
  | ACTIVE               | 12 dígitos + enviar
  v                      v
Abrir Home           Validar formato local
                         |
                         | válido
                         v
                   Validar no backend
                    | ACTIVE | bloqueado/erro
                    v        v
                 Salvar     Exibir motivo
                 sessão     e permanecer
```

## Segurança mínima

A comunicação com o backend deve usar HTTPS, timeout e validação de certificado conforme a política da distribuição. O app não deve conter uma lista local de MACs válidos, uma chave mestra compartilhada ou um bypass de ativação. Logs não devem imprimir o MAC completo; para diagnóstico, deve ser usado um identificador mascarado, como `1234••••9012`.

## Critérios de aceite

A implementação será considerada correta quando um MAC com 11 ou 13 dígitos for recusado, um MAC não cadastrado não abrir a Home, um MAC ativo abrir a Home, um MAC expirado ou revogado bloquear o acesso, dois usuários não puderem receber o mesmo MAC e o estado local não liberar conteúdo depois de uma revogação confirmada.
