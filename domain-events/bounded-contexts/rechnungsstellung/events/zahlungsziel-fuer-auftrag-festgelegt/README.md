## Zahlungsziel für Auftrag festgelegt

## Bounded Kontext

Die _Rechnungsstellung_ produziert das Event, sobald ein Zahlungsziel für einen Auftrag festgelegt wird. Wird kein Zahlungsziel explizit festgelegt (oder alle festgelegten gelöscht), gilt 14 Tage als Default-Wert.

## Feldname

`dokumentiert_zahlungsziel`

## Felder von `dokumentiert_zahlungsziel`

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| `in_tagen`  | Integer  | Pflicht  | Anzahl an Tagen des Zahlungsziels |
| `fuer_auftrag`  | [URI](https://tools.ietf.org/html/rfc3986)  | Pflicht  | Auftrag, für den das Zahlungsziel festgelegt wurde |
| `gueltig_ab`  | [ISO 8601 Kalendertag](https://en.wikipedia.org/wiki/ISO_8601)  | Pflicht | Datum, ab dem das Zahlungsziel für diesen Auftrag gilt. Das Zahlungziel gilt so lange, bis ein anderes Zahlungsziel für diesen Auftrag gilt. Ausschlaggebend für die Gültigkeit ist der Tag, an dem die Rechnung geschrieben wird. |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| `rechnungsstellung.zahlungsziel-fuer-auftrag-festgelegt` | `rechnungsstellung` |
