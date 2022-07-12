## Schicht Entfernt

## Bounded Kontext

Die Schichtplanung (aktuell Staffing) produziert das Event, sobald eine Schicht in einem Auftrag gelöscht wurde. Schichten können nur gelöscht werden, wenn noch kein Student disponiert ist oder war. Schichten in der Vergangenheit können nicht gelöscht werden.

## Feldname

`entfernt_schicht`

## Felder von entfernt_schicht

| Name       | Typ              | Pflichtfeld | Beschreibung                                                                                                   |
| ---------- | ---------------- | ----------- | -------------------------------------------------------------------------------------------------------------- |
| @id        | URI              | Pflicht     | URI der entfernten Schicht                                                                                     |
| in_auftrag | URI              | Pflicht     | Auftrag, für den die Schicht entfernt wurde                                                                    |
| zeitraum   | ISO8601 Interval | Pflicht     | Zeitraum der entfernten Schicht. Bei konkreten Schichten mit Uhrzeit und bei Flextimes ganze Tage (nur Datum). |

## Transport über RabbmitMQ

| Routing Key                     | Exchange       |
| ------------------------------- | -------------- |
| schichtplanung.schicht-entfernt | schichtplanung |
