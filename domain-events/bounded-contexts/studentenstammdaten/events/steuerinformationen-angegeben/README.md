# Steuerinformationen angegeben

Das Event wird publiziert, wenn die Studentin ihre Steuerinformationen hinterlegt hat. Die Steueridentifikationsnummer und die Steuerklasse können unabhängig hinterlegt werden. Dies kann sie in der jobvalley App tun.

## Felder von `gibt_steuerinformationen_an`

| Name                | Typ    | Pflichtfeld | Beschreibung                                    |
| ------------------- | ------ | ----------- | ----------------------------------------------- |
| student             | URI    | Pflicht     | Global eindeutige Identifikation der Studentin. |
| steuerinformationen | Object | Pflicht     | Die Steuerinformationen der Studentin.          |

### Steuerinformationen

| Name                  | Typ                | Pflichtfeld | Beschreibung                                    |
| --------------------- | ------------------ | ----------- | ----------------------------------------------- |
| klasse                | String (Encrypted) | Optional    | Die Steuerklasse (`"1"-"6"`) der Studentin.     |
| identifikationsnummer | String (Encrypted) | Optional    | Die Steueridentifikationsnummer der Studentin.  |

## Transport über RabbitMQ

| Routing Key                                       | Exchange            |
| ------------------------------------------------- | ------------------- |
| studentenstammdaten.steuerinformationen-angegeben | studentenstammdaten |
