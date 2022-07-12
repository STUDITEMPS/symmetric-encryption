## Anzahl benötigter Studenten in Schicht verringert

## Bounded Kontext

Die Schichtplanung (aktuell Staffing) produziert das Event, sobald die Anzahl der Studenten, die in einer Schicht arbeiten sollen, verringert wurde.

## Feldname

`verringert_anzahl_benoetigter_studenten_in_schicht`

## Felder von verringert_anzahl_benoetigter_studenten_in_schicht

| Name                         | Typ     | Pflichtfeld | Beschreibung                                                  |
| ---------------------------- | ------- | ----------- | ------------------------------------------------------------- |
| in_schicht                   | URI     | Pflicht     | URI der Schicht                                               |
| in_auftrag                   | URI     | DEPRECATED  | Auftrag, für den die Schicht hinzugefügt wurde                |
| anzahl_benoetigter_studenten | Integer | DEPRECATED  | Neue Anzahl der Studenten, die in der Schicht arbeiten sollen |
| verringert_um                | Integer | DEPRECATED  | Anzahl um die die Anzahl der Student verringert wurden.       |
| von                          | Integer | Pflicht     | alte Anzahl der benötigten Studenten                          |
| auf                          | Integer | Pflicht     | Wert, um den die Anzahl der Student verringert wurde          |
| um                           | Integer | Pflicht     | alte Anzahl der benötigten Studenten                          |

## Transport über RabbmitMQ

| Routing Key                                                       | Exchange       |
| ----------------------------------------------------------------- | -------------- |
| schichtplanung.anzahl-benoetigter-studenten-in-schicht-verringert | schichtplanung |
