## Bounded Kontext

Der Kontext Assessment produziert das Event, sobald ein Recruiter bewertet, dass ein:e Student:in für Tätigkeitsfelder geeignet ist.

## Felder von bewertet_eignung_fuer_taetigkeitsfelder

| Name              | Typ   | Pflichtfeld | Beschreibung                                                        |
| ----------------- | ----- | ----------- | ------------------------------------------------------------------- |
| student           | URI   | Pflicht     | Global eindeutige Identifikation de:r:s Student:en:in               |
| taetigkeitsfelder | Array | Pflicht     | Liste an Tätigkeitsfeldern, für die der:die Student:in geeignet ist |

### Tätigkeitsfelder URIs

-   `tech.studitemps:taetigkeitsfeld:buerotaetigkeiten`
-   `tech.studitemps:taetigkeitsfeld:kundenkontakt`

## Transport über RabbmitMQ

| Routing Key                                        | Exchange   |
| -------------------------------------------------- | ---------- |
| assessment.student-fuer-taetigkeitsfelder-geeignet | assessment |
