# Sozialversicherungsnummer angegeben

Das Event wird publiziert, wenn die Studentin ihre Sozialversicherungsnummer hinterlegt. Dies kann sie in der jobvalley App tun. Das Event wird sowohl beim initialen Hinterlegen als auch bei Änderungen geworfen.

## Felder von `gibt_sozialversicherungsnummer_an`

| Name                      | Typ                | Pflichtfeld | Beschreibung                                    |
| ------------------------- | ------------------ | ----------- | ----------------------------------------------- |
| student                   | URI                | Pflicht     | Global eindeutige Identifikation der Studentin. |
| sozialversicherungsnummer | String (Encrypted) | Pflicht     | Die Sozialversicherungsnummer der Studentin.    |

## Transport über RabbitMQ

| Routing Key                                             | Exchange            |
| ------------------------------------------------------- | ------------------- |
| studentenstammdaten.sozialversicherungsnummer-angegeben | studentenstammdaten |