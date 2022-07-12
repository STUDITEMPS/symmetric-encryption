## Erstqualifizierung zurückgezogen

## Bounded Kontext

Temping produziert das Event, sobald ein Customer Success Manager (oder evtl. ein sonstiger jobvalley Mitarbeiter, zum Beispiel das Erstqualifizierungs-Team) vermerkt hat, dass ein:e Student:in die Erstqualifizierung doch nicht absolviert hat. Es geht hier um den Fall, dass fälschlicherweise eine Erstqualifizierung bestätigt wurde.

Aktuell kann dies nur vom 3rd Level Support ausgelöst werden, für die Nutzer:innen selbst gibt es nicht die Möglichkeit, die Erstqualifizierung zurückzunehmen.

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
