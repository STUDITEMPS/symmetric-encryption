## Rechnungsturnus für Auftrag festgelegt

## Bounded Kontext

Die _Rechnungsstellung_ produziert das Event, sobald ein Rechnungsturnus für einen Auftrag festgelegt wird. Wird kein Rechnungsturnus explizit festgelegt (oder alle festgelegten gelöscht), gilt "wöchentlich" als Default-Wert.

## Feldname

`dokumentiert_rechnungsturnus`

## Felder von `dokumentiert_rechnungsturnus`

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| `@type`  | [URI](https://tools.ietf.org/html/rfc3986)  | Pflicht  | Typ des Rechnungsturnus. Aktuell möglich: monatlich, wöchentlich, zweiwöchentlich, halbmonatlich. Mögliche Ausprägungen:  `tech.studitemps:rechnungsstellung:rechnungsturnus:woechentlich`, `tech.studitemps:rechnungsstellung:rechnungsturnus:zweiwoechentlich`, `tech.studitemps:rechnungsstellung:rechnungsturnus:halbmonatlich`, `tech.studitemps:rechnungsstellung:rechnungsturnus:monatlich` |
| `fuer_auftrag`  | [URI](https://tools.ietf.org/html/rfc3986)  | Pflicht  | Auftrag, für den der Rechnungsturnus festgelegt wurde |
| `gueltig_ab`  | [ISO 8601 Kalendertag](https://en.wikipedia.org/wiki/ISO_8601)  | Pflicht  | Datum, ab dem der Rechnungsturnus für diesen Auftrag gilt. Der Rechnungsturnus gilt so lange, bis ein anderer Rechnungsturnus für diesen Auftrag gilt. Ausschlaggebend für die Gültigkeit ist der Tag, an dem die Rechnung geschrieben wird. |


## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| `rechnungsstellung.rechnungsturnus-fuer-auftrag-festgelegt` | `rechnungsstellung`  |
