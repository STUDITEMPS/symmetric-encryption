## Urlaub Gewaehrt

## Bounded Kontext

Temping produziert das Event, sobald ein Customer Success Manager (oder evtl. ein sonstiger jobvalley Mitarbeiter) den Urlaub eines Studenten gewährt hat.

## Feldname

`gewaehrt_urlaub`

## Felder von gewaehrt_urlaub

| Name                      | Typ              | Pflichtfeld | Beschreibung                                                        |
| ------------------------- | ---------------- | ----------- | ------------------------------------------------------------------- |
| recruiter                 | URI              | Pflicht     | Customer Success Manager, der dem Studenten die Urlaubstage gewährt                |
| fuer_student              | URI              | Pflicht     | Student, der Urlaub nehmen möchte                                   |
| in_zeitraum               | ISO8601 Interval | Pflicht     | Zeitraum, in dem der Student Urlaub hat. Nur Datum, keine Uhrzeiten |
| auszuzahlende_urlaubstage | Integer          | Pflicht     | Anzahl an bezahlten Urlaubstagen, die dem Student ausgezahlt werden |

## Transport über RabbmitMQ

| Routing Key             | Exchange |
| ----------------------- | -------- |
| temping.urlaub-gewaehrt | temping  |

## Anmerkungen

1.  Der Kontext ist erstmal Temping. Wir kombinieren hier die Abwesenheit, die für so etwas wie Schichtplanung und Zeiterfassung wichtig ist, mit der Lohnfortzahlung im Urlaub. Eine große Prozessänderung ist hierbei, dass der Customer Success Manager allein entscheidet, wie viele Urlaubstage ein Student ausbezahlt bekommt. So kann er das direkt mit dem Studenten klären, ohne dass eine Prüfung durch HR erfolgen muss und der Student erst bei der Abrechnung feststellt, dass er doch weniger Urlaubstage ausbezahlt bekommen hat. Aus diesem Grund nehmen wir den Customer Success Manager explizit in die Payload des Events mit auf.
2.  Es ist denkbar, dass diese Information ganz oder teilweise in Zukunft vom Studenten selbst hinterlegt werden kann, dann würde ein anderer Kontext ein ähnliches Event publizieren.

### Berechnung von Urlaubstagen

Die Studenten, die für uns arbeiten, haben bei Langzeitverträgen über ein ganzes Kalenderjahr in diesem Jahr einen Anspruch auf 20 Tage bzw. 4 Wochen Urlaub. Ein Urlaubstag entspricht 1/5 einer Arbeitswoche an Urlaub. Um also bei einer Woche Urlaub das gleiche Geld ausgezahlt zu bekommen wie bei normaler Arbeit in dieser Woche, muss ein Student 5 Urlaubstage nehmen, unabhängig davon, wie viele Tage er tatsächlich normalerweise dort arbeitet.

Beispiele:

1.  Student arbeitet immer montags und freitags. Er möchte in KW 3 nicht arbeiten, aber sein normales Gehalt bekommen. -> KW 3 als Zeitraum, 5 bezahlte Urlaubstage
2.  Student arbeitet an 7 Tagen in der Woche. Er möchte in KW 3 nicht arbeiten, aber sein normales Gehalt bekommen. -> KW 3 als Zeitraum, 5 bezahlte Urlaubstage
3.  Student arbeitet an 5 Tagen in der Woche, immer gleich lang. Er möchte Montag und Dienstag nicht arbeiten, aber sein normales Gehalt bekommen. -> Mo + Di als Zeitraum, 2 bezahlte Urlaubstage
4.  Student arbeitet montags und dienstags jeweils 4 Stunden, donnerstags 8 Stunden. Er möchte Montag und Dienstag nicht arbeiten, aber sein normales Gehalt bekommen. -> Mo + Di als Zeitraum, 2 oder 3 bezahlte Urlaubstage (normale Wochenarbeitszeit 16 Stunden, davon werden 8 gearbeitet, 8 sollen als Urlaub ausgezahlt werden, also die Hälfte einer Arbeitswoche (= 2,5 Tage), allerdings gehen nur ganze Tage)
5.  Student möchte in KW 3 nicht arbeiten und ein bisschen mehr Urlaubsgeld zur Verfügung haben. -> KW 3 als Zeitraum, bis zu 7 bezahlte Urlaubstage möglich, dadurch erhält das 1,2fache seines normalen Wochengehalts
