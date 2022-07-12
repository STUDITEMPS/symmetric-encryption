# Gesamte Arbeitszeit von Unternehmen abgelehnt

## Bounded Kontext

Der Kontext produziert das Event, sobald das Unternehmen in der _Arbeitszeitbestätigung_ die gesamte, vom Studenten erfasste Arbeitszeit ablehnt. Dieses Event heisst explizit anders als das "NoShow" Event [Student unentschuldigt gefehlt](https://github.com/STUDITEMPS/domain-events/tree/master/bounded-contexts/temping/events/student-unentschuldigt-gefehlt) von Staffing, da das Unternehmen nicht wissen kann, ob der Student in Wirklichkeit entschuldigt gefehlt hat, die Arbeitszeit im falschen Auftrag gelandet ist usw.

## Feldname

`lehnt_gesamte_arbeitszeit_ab`

## Felder von lehnt_gesamte_arbeitszeit_ab

|    Name     |                    Typ                     | Pflichtfeld |                         Beschreibung                         |
| ----------- | ------------------------------------------ | ----------- | ------------------------------------------------------------ |
| @id         | [URI](https://tools.ietf.org/html/rfc3986) | Optional    | Global eindeutige Identifikation der abgelehnten Arbeitszeit |
| von_student | URI                                        | Pflicht     | Student, der die abgelehnte Arbeitszeit erfasst hat          |
| in_auftrag  | URI                                        | Pflicht     | Auftrag, für den der Student arbeiten sollte                 |
| in_schicht  | URI                                        | Optional    | Schicht, in der der Student eingestellt war                  |

## Transport über RabbmitMQ

|                               Routing Key                               |         Exchange          |
| ----------------------------------------------------------------------- | ------------------------- |
| `arbeitszeitbestaetigung.gesamte-arbeitszeit-von-unternehmen-abgelehnt` | `arbeitszeitbestaetigung` |
