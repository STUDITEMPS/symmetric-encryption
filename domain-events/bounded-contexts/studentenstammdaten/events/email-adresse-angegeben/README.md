# Email Adresse angegeben

Das Event wird von der Studentendatenverwaltung produziert, wenn der Student seine  Email Adresse hinterlegt und bestätigt. Dies kann er in der jobvalley App tun. Das Event wird sowohl beim initialen Hinterlegen als auch bei Änderungen geworfen.

## Felder von `gibt_email_adresse_an`

| Name            | Typ     | Pflichtfeld | Beschreibung                                    |
| --------------- | ------- | ----------- | ----------------------------------------------- |
| student         | URI     | Pflicht     | Global eindeutige Identifikation des Studenten. |
| email_adresse   | String  | Pflicht     | Die Email Adresse des Studenten                 |


## Transport über RabbitMQ

| Routing Key                                 | Exchange            |
| ------------------------------------------- | ------------------- |
| studentenstammdaten.email-adresse-angegeben | studentenstammdaten |