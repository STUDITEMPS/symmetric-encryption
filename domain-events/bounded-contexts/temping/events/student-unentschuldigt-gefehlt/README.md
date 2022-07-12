## Student Unentschuldigt Gefehlt

## Bounded Kontext

Temping produziert das Event, sobald ein jobvalley Mitarbeiter hinterlegt hat, dass ein Student unentschuldigt nicht zum (vertraglich vereinbarten) Einsatz erschienen ist.

## Feldname

`dokumentiert_unentschuldigtes_fehlen`

## Felder von dokumentiert_unentschuldigtes_fehlen

| Name | Typ  | Pflichtfeld  | Beschreibung |
|---|---|---|---|
| student  | URI              | Pflicht | Student, der unentschuldigt gefehlt hat      |
| auftrag  | URI              | Pflicht | Auftrag, für den der Student arbeiten sollte |
| schicht  | URI              | Pflicht | Schicht, in der der Student eingestellt war  |
| zeitraum | ISO8601 Interval | Pflicht | Zeitraum, in dem der Student gefehlt hat     |
| stunden  | ISO8601 Duration | Pflicht | Dauer, die der Student gefehlt hat           |

## Transport über RabbmitMQ

| Routing Key | Exchange |
|---|---|
| temping.student-unentschuldigt-gefehlt | temping |


## Anmerkungen

1. Zeitraum und Stunden des Fehlens sind zunächst identisch mit Zeitraum und Netto-Arbeitszeit der Schicht, können sich aber evtl. später unterscheiden, deshalb hier explizit als Fehlstunden und -zeitraum.
