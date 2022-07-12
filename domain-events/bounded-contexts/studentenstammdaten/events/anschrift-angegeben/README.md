# Anschrift angegeben

Das Event wird von der Studentendatenverwaltung produziert, wenn der Student seine gewünschte Anschrift hinterlegt. Dies kann er in der jobvalley App tun. Das Event wird sowohl beim initialen Hinterlegen als auch bei Änderungen geworfen.

## Felder von `gibt_anschrift_an`

| Name            | Typ     | Pflichtfeld | Beschreibung                                    |
| --------------- | ------- | ----------- | ----------------------------------------------- |
| student         | URI     | Pflicht     | Global eindeutige Identifikation des Studenten. |
| anschrift       | Adresse | Pflicht     | Die Anschrift des Studenten.                    |

### Anschrift

| Name            | Typ     | Pflichtfeld | Beschreibung                                    |
| --------------- | ------- | ----------- | ----------------------------------------------- |
| straße          | String  | Pflicht     | Straßenname                                     |
| hausnummer      | String  | Pflicht     | Hausnummer                                      |
| postleitzahl    | String  | Pflicht     | Postleitzahl                                    |
| stadt           | String  | Pflicht     | Stadt                                           |
| land            | String  | Pflicht     | Land                                            |
| zusatz          | String  | Optional    | Adresszusatz                                    |
| latitude        | String  | Optional    | Latitude                                        |
| longitude       | String  | Optional    | Longitude                                       |

## Transport über RabbitMQ

| Routing Key                             | Exchange            |
| --------------------------------------- | ------------------- |
| studentenstammdaten.anschrift-angegeben | studentenstammdaten |
