## Schicht Angelegt

## Bounded Kontext

Die Schichtplanung (aktuell Staffing) produziert das Event, sobald eine neue Schicht in einem Auftrag angelegt wurde.

## Felder

`legt_schicht_an`

## Felder von legt_schicht_an

| Name                         | Typ              | Pflichtfeld | Beschreibung                                                                                                            |
| ---------------------------- | ---------------- | ----------- | ----------------------------------------------------------------------------------------------------------------------- |
| @id                          | URI              | Pflicht     | URI der Schicht                                                                                                         |
| in_auftrag                   | URI              | Pflicht     | Auftrag, für den die Schicht hinzugefügt wurde                                                                          |
| zeitraum                     | ISO8601 Interval | Pflicht     | Zeitraum der Schicht. Bei konkreten Schichten mit Uhrzeit und bei Flextimes ganze Tage (nur Datum)(gibt es nicht mehr). |
| anzahl_benoetigter_studenten | Integer          | Pflicht     | Anzahl der Studenten, die in der Schicht arbeiten sollen                                                                |
| netto_arbeitszeit            | ISO8601 Duration | Pflicht     | Nettoarbeitszeit ohne Pause.                                                                                            |
| pause                        | ISO8601 Duration | Optional    | Pausendauer. Ist bei Flextimes nie vorhanden, aber bei konkreten Schichten optional.                                    |

## Transport über RabbmitMQ

| Routing Key                     | Exchange       |
| ------------------------------- | -------------- |
| schichtplanung.schicht-angelegt | schichtplanung |
