## Wochenarbeitszeit für Auftrag gelöscht

## Bounded Kontext

Die _Rechnungsstellung_ produziert das Event, sobald eine Wochenarbeitszeit für einen Auftrag gelöscht wird.

## Feldname

`loescht_wochenarbeitszeit`

## Felder von `loescht_wochenarbeitszeit`

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| `fuer_auftrag` | [URI](https://tools.ietf.org/html/rfc3986)  | Pflicht  | Auftrag, für den die Wochenarbeitszeit gelöscht wurde |
| `gueltig_ab` | [ISO 8601 Kalendertag](https://en.wikipedia.org/wiki/ISO_8601)  | Pflicht  | Datum, ab dem die Wochenarbeitszeit für diesen Auftrag galt. |


## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| `rechnungsstellung.wochenarbeitszeit-fuer-auftrag-geloescht` | `rechnungsstellung`  |
