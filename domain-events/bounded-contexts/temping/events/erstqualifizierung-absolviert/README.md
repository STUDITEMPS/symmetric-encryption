## Erstqualifizierung absolviert

## Bounded Kontext

Temping produziert das Event, sobald ein:e jobvalley Mitarbeiter:in vermerkt hat, dass ein:e Student:in beim erstmaligen Jobinterview war.

Der Prozess hieß früher Erstqualifzierung (und noch vorher Intake) und inhaltlich soll auch weiterhin eine erste Qualifizierung der Student:innen während des Jobinterviews vorgenommen werden. Um diesen Termin von der bisherigen Form der Erstqualifzierungstermine inklusive kurzer jobvalley-Schulung abzuheben, wurde der Termin in "Jobinterview" umbenannt.

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
