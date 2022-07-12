## Student aus Schicht entfernt

## Bounded Kontext

Das Event "Student aus Schicht entfernt" wird produziert, sobald ein Student aus dem Schichtplanung genommen wird. Das Event ist das Gegenstück zu "Student in Schicht disponiert".

## `entfernt_student_aus_schicht`

| Name       | Type   | Pflichtfeld | Beschreibung                                             |
| ---------- | ------ | ----------- | -------------------------------------------------------- |
| student    | URI    | Pflicht     | Student, der aus der Schicht entfernt wurde.             |
| in_auftrag | URI    | Pflicht     | Auftrag der Schicht, aus der der Student entfernt wurde. |
| schicht    | Object | Pflicht     | Schicht, aus der der Student entfernt wurde.             |

## `schicht`

| Name              | Type                  | Pflichtfeld | Beschreibung                                                                                        |
| ----------------- | --------------------- | ----------- | --------------------------------------------------------------------------------------------------- |
| @id               | URI                   | Pflicht     | URI der Schicht.                                                                                    |
| zeitraum          | ISO8601 Time Interval | Pflicht     | Zeitraum der Schicht. Bei konkreten Schichten mit Uhrzeit und bei Flextimes ganze Tage (nur Datum). |
| netto_arbeitszeit | ISO8601 Duration      | Pflicht     | Netto arbeitszeit ohne Pause.                                                                       |
| pause             | ISO8601 Duration      | Optional    | Pausendauer. Ist bei Felxtimes nie vorhanden aber bei konkreten Schichten optional.                 |

## Transport über RabbmitMQ

| Routing Key                                 | Exchange       |
| ------------------------------------------- | -------------- |
| schichtplanung.student-aus-schicht-entfernt | schichtplanung |
