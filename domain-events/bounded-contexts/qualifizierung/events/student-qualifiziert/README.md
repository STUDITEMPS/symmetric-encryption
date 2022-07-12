# Student qualifiziert

Das Event "Student qualifiziert" wird produziert, sobald die Studentin in der Qualifizierung als qualifiziert markiert wird. Die Spalte wird aktuell "Einsatzbereit" genannt, soll aber vermutlich wieder in "Qualifiziert" umbenannt werden.

## `qualifiziert_student`

| Name    | Type | Pflichtfeld | Beschreibung                                       |
| ------- | ---- | ----------- | -------------------------------------------------- |
| student | URI  | Pflicht     | Die Studentin, die im Auftrag qualifiziert wurde.  |
| auftrag | URI  | Pflicht     | Auftrag, für den die Studentin qualifiziert wurde. |

## Transport über RabbmitMQ

| Routing Key                         | Exchange       |
| ----------------------------------- | -------------- |
| qualifizierung.student-qualifiziert | qualifizierung |
