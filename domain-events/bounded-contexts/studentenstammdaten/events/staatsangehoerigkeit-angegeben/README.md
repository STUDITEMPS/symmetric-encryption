# Staatsangehörigkeit angegeben

Das Event wird von der Studentendatenverwaltung produziert, wenn der Student seine Staatsangehörigkeit hinterlegt. Dies kann er in der jobvalley App tun. Das Event wird sowohl beim initialen Hinterlegen als auch bei Änderungen geworfen.

## Felder von `gibt_staatsangehoerigkeit_an`

| Name            | Typ     | Pflichtfeld | Beschreibung                                    |
| --------------- | ------- | ----------- | ----------------------------------------------- |
| student         | URI     | Pflicht     | Global eindeutige Identifikation des Studenten. |
| staat           | String  | Pflicht     | Der Staat dem der Student zugehörig ist.        |

### Staat

| Name                       | Typ     | Pflichtfeld | Beschreibung                                      |
| -------------------------- | ------- | ----------- | ------------------------------------------------- |
| uri                        | URI     | Pflicht     | Identifikation des Staates in URI Format          |
| id                         | UUID    | Pflicht     | Identifikation des Staates.                       |
| name                       | String  | Pflicht     | Der Name des Staates.                             |
| iso_code                   | String  | Pflicht     | Der ISO Code des Staates.                         |

## Transport über RabbitMQ

| Routing Key                                        | Exchange            |
| -------------------------------------------------- | ------------------- |
| studentenstammdaten.staatsangehoerigkeit-angegeben | studentenstammdaten |