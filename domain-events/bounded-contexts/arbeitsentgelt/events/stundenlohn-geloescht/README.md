## Stundenlohn gelöscht

## Bounded Kontext

_Arbeitsentgelt_ produziert das Event, sobald ein Stundenlohn gelöscht wurde.

## Feldname

`loescht_stundenlohn`

## Felder von `loescht_stundenlohn`

| Name | Typ  | Pflichtfeld  | Beschreibung |
|---|---|---|---|
| `fuer_auftrag` | [URI](https://tools.ietf.org/html/rfc3986) | Pflicht | Auftrag, für den der Stundenlohn gelöscht wurde. |
| `gueltig_ab` | [ISO 8601 Kalendertag](https://en.wikipedia.org/wiki/ISO_8601) | Pflicht | Datum, ab dem der Stundenlohn für diesen Auftrag galt. |

## Transport über RabbmitMQ

| Routing Key | Exchange |
|---|---|
| `arbeitsentgelt.stundenlohn-geloescht` | `arbeitsentgelt` |
