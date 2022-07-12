# Name angegeben

Das Event wird von der Studentendatenverwaltung produziert, wenn der Student seinen Namen hinterlegt. Dies kann er in der jobvalley App tun. Das Event wird sowohl beim initialen Hinterlegen als auch bei Änderungen geworfen.

## Felder von `gibt_name_an`

| Name            | Typ     | Pflichtfeld | Beschreibung                                    |
| --------------- | ------- | ----------- | ----------------------------------------------- |
| student         | URI     | Pflicht     | Global eindeutige Identifikation des Studenten. |
| vorname         | String  | Pflicht     | Der Vorname des Studenten.                      |
| nachname        | String  | Pflicht     | Der Nachname des Studenten.                     |


## Transport über RabbitMQ

| Routing Key                          | Exchange            |
| ------------------------------------ | ------------------- |
| studentenstammdaten.name-angegeben | studentenstammdaten |