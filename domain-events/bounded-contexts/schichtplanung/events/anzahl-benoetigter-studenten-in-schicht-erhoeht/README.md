## Anzahl benötigter Studenten in Schicht erhöht

## Bounded Kontext

Die Schichtplanung (aktuell Staffing) produziert das Event, sobald die Anzahl der Studenten, die in einer Schicht arbeiten sollen, erhöht wurde.

Dies kann passieren, indem ein Staffing-Mitarbeiter die Erhöhung in der Schichtplanung in Staffing veranlasst oder wenn ein Kundenmitarbeiter
die Erhöhung der Anzahl im Kundenportal beantragt hat und das aus Sicht des Schichtplanung-Kontexts in Ordnung geht.

## Feldname

`erhoeht_anzahl_benoetigter_studenten_in_schicht`

## Felder von erhoeht_anzahl_benoetigter_studenten_in_schicht

| Name                         | Typ     | Pflichtfeld | Beschreibung                                                  |
| ---------------------------- | ------- | ----------- | ------------------------------------------------------------- |
| in_schicht                   | URI     | Pflicht     | URI der Schicht                                               |
| in_auftrag                   | URI     | DEPRECATED  | Auftrag, für den die Schicht hinzugefügt wurde                |
| anzahl_benoetigter_studenten | Integer | DEPRECATED  | Neue Anzahl der Studenten, die in der Schicht arbeiten sollen |
| erhoeht_um                   | Integer | DEPRECATED  | Anzahl um die die Anzahl der Student erhöht wurden.           |
| von                          | Integer | Pflicht     | Ursprüngliche Anzahl benötigter Studenten                     |
| auf                          | Integer | Pflicht     | Neue Anzahl der Studenten, die in der Schicht arbeiten sollen |
| um                           | Integer | Pflicht     | Anzahl um die die Anzahl der Student erhöht wurden.           |

## Transport über RabbmitMQ

| Routing Key                                                    | Exchange       |
| -------------------------------------------------------------- | -------------- |
| schichtplanung.anzahl-benoetigter-studenten-in-schicht-erhoeht | schichtplanung |
