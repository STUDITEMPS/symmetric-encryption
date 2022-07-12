## Zuschlagsssatz gelöscht

## Bounded Kontext

Das _Arbeitsentgelt_ produziert das Event, sobald ein Zuschlagssatz für einen Auftrag gelöscht wurde.

## Feldname

`loescht_zuschlagssatz`

## Felder von `loescht_zuschlagssatz`

| Name | Typ  | Pflichtfeld  | Beschreibung |
|---|---|---|---|
| `fuer_auftrag` | [URI](https://tools.ietf.org/html/rfc3986) | Pflicht | Auftrag, für den der Zuschlagssatz geloescht wurde|
| `gueltig_ab` | [ISO 8601 Kalendertag](https://en.wikipedia.org/wiki/ISO_8601) | Pflicht | Datum, ab dem der Zuschlagssatz für diesen Auftrag galt. Der davor geltende Zuschlagssatz gilt nun, bis ein weiterer gilt. |

## Transport über RabbmitMQ

| Routing Key | Exchange |
|---|---|
| `arbeitsentgelt.zuschlagssatz-geloescht` | `arbeitsentgelt` |
