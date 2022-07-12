## Verrechnungssatz für Auftrag festgelegt

## Bounded Kontext

Die _Rechnungsstellung_ produziert das Event, sobald ein Verrechnungssatz für einen Auftrag festgelegt wurde. Der Verrechnungssatz gibt an, mit wie viel Euro (im Event in Cent angegeben) pro Stunde der Student beim Unternehmen in Rechnung gestellt wird.

## Feldname

`dokumentiert_verrechnungssatz`

## Felder von `dokumentiert_verrechnungssatz`

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| `hoehe_in_cent`  | Integer  | Pflicht  | Höhe des Verrechnungssatzes in Cent |
| `fuer_auftrag`  | [URI](https://tools.ietf.org/html/rfc3986)  | Pflicht  | Auftrag, für den der Verrechnungssatz festgelegt wurde |
| `gueltig_ab`  | [ISO 8601 Kalendertag](https://en.wikipedia.org/wiki/ISO_8601)  | Pflicht  | Datum, ab dem der Verrechnungssatz für diesen Auftrag gilt. Der Verrechnungssatz gilt so lange, bis ein anderer Verrechnungssatz gilt. |


## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| `rechnungsstellung.verrechnungssatz-fuer-auftrag-festgelegt` | `rechnungsstellung`  |
