## Student Unentschuldigt Gefehlt Entfernt

## Bounded Kontext

Temping produziert das Event, sobald ein jobvalley Mitarbeiter das unendschuldigte Fehlen (No Show) eines Studenten wieder entfernt hat.
Dabei ist der Grund des Entfernen aktuell nicht bekannt (vertan, entschuldigt, etc).

## Feldname

`entfernt_unentschuldigtes_fehlen`

## Felder von entfernt_unentschuldigtes_fehlen

| Name     | Typ              | Pflichtfeld | Beschreibung                                                       |
| -------- | ---------------- | ----------- | ------------------------------------------------------------------ |
| student  | URI              | Pflicht     | Student, der doch nicht unentschuldigt gefehlt hat                 |
| schicht  | URI              | Pflicht     | Schicht, in der der Student eingestellt war                        |
| zeitraum | ISO8601 Interval | Pflicht     | Zeitraum, in dem der Student doch nicht unentschuldigt gefehlt hat |

## Transport über RabbmitMQ

| Routing Key                                     | Exchange |
| ----------------------------------------------- | -------- |
| temping.student-unentschuldigt-gefehlt-entfernt | temping  |
