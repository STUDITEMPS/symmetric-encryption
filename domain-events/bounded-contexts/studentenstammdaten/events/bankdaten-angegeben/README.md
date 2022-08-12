# Bankdaten angegeben

Das Event wird publiziert, wenn der Student seine Bankdaten hinterlegt. Dies kann er in der jobvalley App tun. Das Event wird sowohl beim initialen Hinterlegen als auch bei Änderungen geworfen.

## Felder von `gibt_bankdaten_an`

| Name           | Typ    | Pflichtfeld | Beschreibung                                    |
| -------------- | ------ | ----------- | ----------------------------------------------- |
| student        | URI    | Pflicht     | Global eindeutige Identifikation des Studenten. |
| bankdaten      | Object | Pflicht     | Die Bankdaten des Studenten.                    |

### Bankdaten

| Name         | Typ                | Pflichtfeld | Beschreibung                            |
| ------------ | ------------------ | ----------- | --------------------------------------- |
| iban         | String (Encrpyted) | Pflicht     | International bank account number       |
| bic          | String (Encrypted) | Pflicht     | Business identifier code                |

## Transport über RabbitMQ

| Routing Key                             | Exchange            |
| --------------------------------------- | ------------------- |
| studentenstammdaten.bankdaten-angegeben | studentenstammdaten |
