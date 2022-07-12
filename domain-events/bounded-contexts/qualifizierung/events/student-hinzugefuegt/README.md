# Student hinzugefügt

Das Event "Student hinzugefügt" wird produziert, sobald die Studentin der Qualifizierung eines Auftrags hinzugefügt wird.

## Felder von `fuegt_student_hinzu`

| Name    | Type | Pflichtfeld | Beschreibung                                                         |
| ------- | ---- | ----------- | -------------------------------------------------------------------- |
| student | URI  | Pflicht     | Die Studentin, die der Qualifizierung hinzugefügt wurde.             |
| auftrag | URI  | Pflicht     | Auftrag, zu dem die Studentin hinzugefügt wurde.                     |

## Transport über RabbmitMQ

| Routing Key                         | Exchange       |
| ----------------------------------- | -------------- |
| qualifizierung.student-hinzugefuegt | qualifizierung |
