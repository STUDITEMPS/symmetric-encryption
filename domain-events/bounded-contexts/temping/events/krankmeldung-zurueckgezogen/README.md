## Krankmeldung zurückgezogen

## Bounded Kontext

Temping produziert das Event, sobald ein Customer Success Manager (oder evtl. ein sonstiger jobvalley Mitarbeiter) die Krankmeldung eines Studenten zurückzieht.

## Feldname

`zieht_krankmeldung_zurueck`

## Felder von zieht_krankmeldung_zurueck

| Name                         | Typ              | Pflichtfeld | Beschreibung                                                                      |
| ---------------------------- | ---------------- | ----------- | --------------------------------------------------------------------------------- |
| durch_studitemps_mitarbeiter | URI              | Pflicht     | jobvalley Mitarbeiter, der die Krankmeldung zurückzieht                          |
| von_student                  | URI              | Pflicht     | Student, dessen Krankmeldung zurückgezogen wird                                   |
| fuer_zeitraum                | ISO8601 Interval | Pflicht     | Zeitraum, für den die Krankmeldung zurückgezogen wird. Nur Datum, keine Uhrzeiten |

## Transport über RabbmitMQ

| Routing Key                         | Exchange |
| ----------------------------------- | -------- |
| temping.krankmeldung-zurueckgezogen | temping  |
