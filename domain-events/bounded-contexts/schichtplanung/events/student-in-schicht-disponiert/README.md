## Student in schicht disponiert

## Bounded Kontext

Das Event "Student in Schicht disponiert" wird produziert, sobald ein Student in einer Schicht disponiert wurde.

Eine Disposition kann erfolgen, indem ein Customer Success Manager den Studenten in eine Schicht einstellt, oder indem ein Student sich erfolgreich in eine Schicht eingebucht hat.

## `disponiert_student_in_schicht`

| Name       | Type    | Pflichtfeld | Beschreibung                                            |
| ---------- | ------- | ----------- | ------------------------------------------------------- |
| student    | URI     | Pflicht     | Der Student der aus der Schicht entfernt wurde.         |
| in_auftrag | URI     | Pflicht     | Auftrag der Schicht aus der der Student entfernt wurde. |
| schicht    | Schicht | Pflicht     | Schicht aus der der Student entfernt wurde.             |

## `schicht`

| Name              | Type                  | Pflichtfeld | Beschreibung                                                                                                                   |
| ----------------- | --------------------- | ----------- | ------------------------------------------------------------------------------------------------------------------------------ |
| @id               | URI                   | Pflicht     | URI der Schicht.                                                                                                               |
| zeitraum          | ISO8601 Time Interval | Pflicht     | Zeitraum der Schicht. Bei konkreten Schichten mit Uhrzeit und bei Flextimes ganze Tage (nur Datum)(kann nicht mehr vorkommen). |
| netto_arbeitszeit | ISO8601 Duration      | Pflicht     | Netto arbeitszeit ohne Pause.                                                                                                  |
| pause             | ISO8601 Duration      | Optional    | Pausendauer.                                                                                                                   |

## Transport über RabbmitMQ

| Routing Key                                  | Exchange       |
| -------------------------------------------- | -------------- |
| schichtplanung.student-in-schicht-disponiert | schichtplanung |
