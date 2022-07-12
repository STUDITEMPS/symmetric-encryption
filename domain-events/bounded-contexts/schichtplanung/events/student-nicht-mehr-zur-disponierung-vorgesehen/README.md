## Student nicht mehr zur Disponierung vorgesehen

## Bounded Kontext

Die Schichtplanung produziert das Event "Student nicht mehr zur Disponierung vorgesehen", sobald der Student nicht mehr im Auftrag eingestellt werden kann, egal ob die Einstellung durch den Customer Success Manager oder durch ein Einbuchen des Studenten stattfindet.

Der Student ist damit weiterhin für den Auftrag qualifiziert, wird jedoch zur Zeit nicht eingesetzt.

Aktuell ist das die Aufhebung von StudentQualifiziert im Kontext des Einstellens/Einbuchens/Planens. Perspektivisch wollen wir auch dort die Qualifizierung und potentielle Einstellung trennen.

## `sieht_student_nicht_mehr_zur_disponierung_vor`

| Name       | Type | Pflichtfeld | Beschreibung                                                         |
| ---------- | ---- | ----------- | -------------------------------------------------------------------- |
| student    | URI  | Pflicht     | Der Student, der im Auftrag nicht mehr eingesetzt werden kann.       |
| in_auftrag | URI  | Pflicht     | Auftrag, für den der Student nicht mehr eingesetzt werden kann.      |

## Transport über RabbmitMQ

| Routing Key                                                   | Exchange       |
| ------------------------------------------------------------- | -------------- |
| schichtplanung.student-nicht-mehr-zur-disponierung-vorgesehen | schichtplanung |
