## Erstqualifizierung zurückgezogen

## Bounded Kontext

Temping produziert das Event, sobald festgestellt wurde, dass ein:e Student:in doch noch nicht beim erstmaligen Jobinterview war. Es geht hier um den Fall, dass fälschlicherweise eine Jobinterview-Teilnahme bestätigt wurde. Aktuell kann dies nur vom 3rd Level Support ausgelöst werden, für die Nutzer:innen selbst gibt es nicht die Möglichkeit, dies zurückzunehmen.

Der Prozess hieß früher Erstqualifzierung (und noch vorher Intake) und inhaltlich soll auch weiterhin eine erste Qualifizierung der Student:innen während des Jobinterviews vorgenommen werden. Um diesen Termin von der bisherigen Form der Erstqualifzierungstermine inklusive kurzer jobvalley-Schulung abzuheben, wurde der Termin in "Jobinterview" umbenannt.

## Feldname

`zieht_erstqualifizierung_zurueck`

## Felder von zieht_erstqualifizierung_zurueck

| Name                         | Typ              | Pflichtfeld | Beschreibung                                                            |
| ---------------------------- | ---------------- | ----------- | ----------------------------------------------------------------------- |
            |
| student                  | URI              | Pflicht     | Student, der die Erstqualifizierung doch nicht hinter sich hat |

## Transport über RabbmitMQ

| Routing Key                 | Exchange |
| --------------------------- | -------- |
| temping.erstqualifizierung-zurueckgezogen | temping  |
