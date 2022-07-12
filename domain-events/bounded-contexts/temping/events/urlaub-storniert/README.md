## Urlaub Storniert

## Bounded Kontext

Temping produziert das Event, sobald ein Customer Success Manager (oder evtl. ein sonstiger jobvalley Mitarbeiter) den Urlaub eines Studenten storniert hat.

## Feldname

`storniert_urlaub`

## Felder von storniert_urlaub

| Name | Typ  | Pflichtfeld  | Beschreibung |
|---|---|---|---|
| fuer_student          | URI              | Pflicht | Student, der seinen Urlaub nicht mehr nehmen möchte                         |
| in_zeitraum           | ISO8601 Interval | Pflicht | Zeitraum, in dem der Student Urlaub haben sollte                            |

## Transport über RabbmitMQ

| Routing Key | Exchange |
|---|---|
| temping.urlaub-storniert | temping |


## Anmerkungen

1. siehe Anmerkungen zu Urlaub Eingetragen
2. Urlaub kann jederzeit storniert werden.
