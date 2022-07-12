# Telefonnummer angegeben

Das Event wird von der Studentendatenverwaltung produziert, wenn der Student seine Mobilnummer hinterlegt. Dies kann er in der jobvalley App tun. Das Event wird sowohl beim initialen Hinterlegen als auch bei Änderungen geworfen.

## Felder von `gibt_mobilnummer_an`

| Name            | Typ     | Pflichtfeld | Beschreibung                                    |
| --------------- | ------- | ----------- | ----------------------------------------------- |
| student         | URI     | Pflicht     | Global eindeutige Identifikation des Studenten. |
| mobilnummer     | String  | Pflicht     | Mobilnummer des Studenten mit abgetrennter Vorwahl (z.B. `+49 0221 23456789`) |

## Transport über RabbitMQ

| Routing Key                               | Exchange            |
| ----------------------------------------- | ------------------- |
| studentenstammdaten.mobilnummer-angegeben | studentenstammdaten |