## Erstqualifizierung absolviert

## Bounded Kontext

Temping produziert das Event, sobald ein Customer Success Manager (oder evtl. ein sonstiger jobvalley Mitarbeiter, zum Beispiel das Erstqualifizierungs-Team) vermerkt hat, dass ein:e Student:in die Erstqualifizierung absolviert hat.

## Feldname

`bestaetigt_erstqualifizierung`

## Felder von bestaetigt_erstqualifizierung

| Name                         | Typ              | Pflichtfeld | Beschreibung                                                            |
| ---------------------------- | ---------------- | ----------- | ----------------------------------------------------------------------- |
| student                  | URI              | Pflicht     | Student, der die Erstqualifizierung hinter sich hat |
| datum                    | ISO8601 Date | Pflicht | Datum der Erstqualifzierung.                                   |

## Transport über RabbmitMQ

| Routing Key                 | Exchange |
| --------------------------- | -------- |
| temping.erstqualifizierung-absolviert | temping  |
