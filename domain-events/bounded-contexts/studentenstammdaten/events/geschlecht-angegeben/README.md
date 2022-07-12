# Geschlecht angegeben

Das Event wird von der Studentendatenverwaltung produziert, wenn der Student sein Geschlecht hinterlegt. Dies kann er in der jobvalley App tun. Das Event wird sowohl beim initialen Hinterlegen als auch bei Änderungen geworfen.

## Felder von `gibt_geschlecht_an`

| Name            | Typ     | Pflichtfeld | Beschreibung                                    |
| --------------- | ------- | ----------- | ----------------------------------------------- |
| student         | URI     | Pflicht     | Global eindeutige Identifikation des Studenten. |
| geschlecht      | String  | Pflicht     | Geschlecht des Studenten                        |

### Mögliche Werte für geschlecht

-   `divers`, `weiblich`, `männlich`

## Transport über RabbitMQ

| Routing Key                              | Exchange            |
| ---------------------------------------- | ------------------- |
| studentenstammdaten.geschlecht-angegeben | studentenstammdaten |