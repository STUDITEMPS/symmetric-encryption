## Wochenarbeitszeit für Auftrag festgelegt

## Bounded Kontext

Die _Rechnungsstellung_ produziert das Event, sobald eine Wochenarbeitszeit für einen Auftrag festgelegt wird.

## Feldname

`dokumentiert_wochenarbeitszeit`

## Felder von `dokumentiert_wochenarbeitszeit`

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| `in_stunden` | Float  | Pflicht  | Stundenzahl der Wochenarbeitszeit. Schwellwert für die Berechnung des Mehrarbeitszuschlags. |
| `fuer_auftrag`  | [URI](https://tools.ietf.org/html/rfc3986)  | Pflicht  | Auftrag, für den der Rechnungsturnus festgelegt wurde |
| `gueltig_ab`  | [ISO 8601 Kalendertag](https://en.wikipedia.org/wiki/ISO_8601)  | Pflicht  | Datum, ab dem der Rechnungsturnus für diesen Auftrag gilt. Der Rechnungsturnus gilt so lange, bis ein anderer Rechnungsturnus für diesen Auftrag gilt. Ausschlaggebend für die Gültigkeit ist der Tag, an dem die Rechnung geschrieben wird. |


## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| `rechnungsstellung.rechnungsturnus-fuer-auftrag-festgelegt` | `rechnungsstellung`  |
