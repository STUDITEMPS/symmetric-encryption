## Rechnungsturnus für Auftrag gelöscht

## Bounded Kontext

Die _Rechnungsstellung_ produziert das Event, sobald ein Rechnungsturnus für einen Auftrag gelöscht wurde.

## Feldname

`loescht_rechnungsturnus`

## Felder von `loescht_rechnungsturnus`

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| `fuer_auftrag`  | [URI](https://tools.ietf.org/html/rfc3986)  | Pflicht  | Auftrag, für den der Rechnungsturnus festgelegt wurde |
| `gueltig_ab`  | [ISO 8601 Kalendertag](https://en.wikipedia.org/wiki/ISO_8601)  | Pflicht  | Datum, ab dem der Rechnungsturnus für diesen Auftrag galt. |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| `rechnungsstellung.rechnungsturnus-fuer-auftrag-geloescht` | `rechnungsstellung`  |
