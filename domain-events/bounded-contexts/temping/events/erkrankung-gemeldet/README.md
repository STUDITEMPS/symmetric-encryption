## Erkrankung gemeldet

## Bounded Kontext

Temping produziert das Event, sobald ein Customer Success Manager (oder evtl. ein sonstiger jobvalley Mitarbeiter) die Erkrankung eines Studenten gemeldet hat.

## Feldname

`meldet_erkrankung`

## Felder von meldet_erkrankung

| Name                         | Typ              | Pflichtfeld | Beschreibung                                                            |
| ---------------------------- | ---------------- | ----------- | ----------------------------------------------------------------------- |
| durch_studitemps_mitarbeiter | URI              | Pflicht     | jobvalley Mitarbeiter, der die Erkrankung einträgt                     |
| von_student                  | URI              | Pflicht     | Student, der seine Erkrankung dem jobvalley Mitarbeiter mitgeteilt hat |
| fuer_zeitraum                | ISO8601 Interval | Pflicht     | Zeitraum, in dem der Student krank ist. Nur Datum, keine Uhrzeiten      |

## Transport über RabbmitMQ

| Routing Key                 | Exchange |
| --------------------------- | -------- |
| temping.erkrankung-gemeldet | temping  |

## Anmerkungen

1.  Der Kontext ist erstmal Temping. Es geht hier explizit darum, dass ein Staffing-Mitarbeiter die Information über Erkrankung, die er vom Studenten erfahren hat, einträgt. Deshalb wird der Mitarbeiter auch im Event selbst erwähnt und ist nicht nur Teil der Metainformationen.
2.  Es ist denkbar, dass diese Information in Zukunft vom Studenten selbst hinterlegt werden kann, dann würde ein anderer Kontext ein ähnliches Event publizieren.
