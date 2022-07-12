## Zahlungsziel für Auftrag gelöscht

## Bounded Kontext

Die _Rechnungsstellung_ produziert das Event, sobald ein Zahlungsziel für einen Auftrag gelöscht wurde.

## Feldname

`loescht_zahlungsziel`

## Felder von `loescht_zahlungsziel`

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| `fuer_auftrag`  | [URI](https://tools.ietf.org/html/rfc3986)  | Pflicht  | Auftrag, für den das Zahlungsziel gelöscht wurde |
| `gueltig_ab`  | [ISO 8601 Kalendertag](https://en.wikipedia.org/wiki/ISO_8601)  | Pflicht | Datum, ab dem das Zahlungsziel für diesen Auftrag galt. |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| `rechnungsstellung.zahlungsziel-fuer-auftrag-geloescht` | `rechnungsstellung` |
