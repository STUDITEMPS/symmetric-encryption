## Stundenlohn festgelegt

## Bounded Kontext

_Arbeitsentgelt_ produziert das Event, sobald ein Stundenlohn festgelegt wurde. Es ist zusätzlich möglich, einen [Stundenlohn zu löschen](../stundenlohn-geloescht/README.md). Der Stundenlohn gilt ab dem definierten Tag bis in alle Ewigkeit oder bis ein anderer Stundenlohn zu gelten beginnt.

## Feldname

`dokumentiert_stundenlohn`

## Felder von `dokumentiert_stundenlohn`

| Name | Typ  | Pflichtfeld  | Beschreibung |
|---|---|---|---|
| `hoehe_in_cent`| Integer | Pflicht | Höhe des Stundenlohns in Euro Cent. |
| `fuer_auftrag` | [URI](https://tools.ietf.org/html/rfc3986) | Pflicht | Auftrag, für den der Stundenlohn festgelegt wurde. |
| `gueltig_ab` | [ISO 8601 Kalendertag](https://en.wikipedia.org/wiki/ISO_8601) | Pflicht | Datum, ab dem der Stundenlohn für diesen Kostenträger gilt. Der Stundenlohn gilt so lange, bis ein anderer Stundenlohn gilt. |

## Transport über RabbmitMQ

| Routing Key | Exchange |
|---|---|
| `arbeitsentgelt.stundenlohn-festgelegt` | `arbeitsentgelt` |
