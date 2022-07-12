## Student zur Disponierung vorgesehen

## Bounded Kontext

Die Schichtplanung produziert das Event "Student zur Disponierung vorgesehen", sobald der Student im Auftrag eingestellt werden kann, egal ob die Einstellung durch den Customer Success Manager oder durch ein Einbuchen des Studenten stattfindet.

Aktuell wird das Event zeitgleich mit StudentQualifiziert im Kontext des Einstellens/Einbuchens/Planens produziert.

## `sieht_student_zur_disponierung_vor`

| Name       | Type | Pflichtfeld | Beschreibung                                         |
| ---------- | ---- | ----------- | ---------------------------------------------------- |
| student    | URI  | Pflicht     | Der Student, der im Auftrag eingesetzt werden kann.  |
| in_auftrag | URI  | Pflicht     | Auftrag, für den der Student eingesetzt werden kann. |

## Transport über RabbmitMQ

| Routing Key                                        | Exchange       |
| -------------------------------------------------- | -------------- |
| schichtplanung.student-zur-disponierung-vorgesehen | schichtplanung |
