# Geburtsdatum angegeben

Das Event wird von der Studentendatenverwaltung produziert, wenn der Student sein Geburtsdatum hinterlegt. Dies kann er in der jobvalley App tun.
Das Event wird sowohl beim initialen Hinterlegen als auch bei Änderungen geworfen.

## Felder von `gibt_geburtsdatum_an`

| Name            | Typ           | Pflichtfeld | Beschreibung                                    |
| --------------- | ------------- | ----------- | ----------------------------------------------- |
| student         | URI           | Pflicht     | Global eindeutige Identifikation des Studenten. |
| geburtsdatum    | ISO8601 Datum | Pflicht     | Das Geburtsdatum des Studenten                  |


## Transport über RabbitMQ

| Routing Key                                | Exchange            |
| ------------------------------------------ | ------------------- |
| studentenstammdaten.geburtsdatum-angegeben | studentenstammdaten |