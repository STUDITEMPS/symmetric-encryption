# Berufserfahrung angegeben

Das Event wird von der Studentendatenverwaltung produziert, wenn der Student seine Berufserfahrung hinterlegt. Dies kann er in der jobvalley App tun. Das Event wird sowohl beim initialen Hinterlegen als auch bei Änderungen geworfen. Das Event beinhaltet immer alle derzeit vom Studenten hinterlegten Tätigkeiten.

## Felder von `gibt_berufserfahrung_an`

| Name            | Typ     | Pflichtfeld | Beschreibung                                    |
| --------------- | ------- | ----------- | ----------------------------------------------- |
| student         | URI     | Pflicht     | Global eindeutige Identifikation des Studenten. |
| berufserfahrung | Array   | Pflicht     | Array früherer Jobs des Studenten.              |

### Berufserfahrung

| Name           | Typ            | Pflichtfeld | Beschreibung                                          |
| -------------- | -------------- | ----------- | ----------------------------------------------------- |
| taetigkeit     | String         | Pflicht     | Name der Tätigkeit                                    |
| arbeitgeber    | String         | Pflicht     | Name des Arbeitgebers (Name der Firma)                |
| start          | ISO 8601 Month | Pflicht     | Beginn der Tätigkeit                                   |
| ende           | ISO 8601 Month | Optional    | Ende der Tätigkeit (`null`, falls noch nicht beendet) |

## Transport über RabbitMQ

| Routing Key                                   | Exchange            |
| --------------------------------------------- | ------------------- |
| studentenstammdaten.berufserfahrung-angegeben | studentenstammdaten |
