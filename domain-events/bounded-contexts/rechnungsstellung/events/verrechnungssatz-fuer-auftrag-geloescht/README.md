## Verrechnungssatz für Auftrag gelöscht

## Bounded Kontext

Die _Rechnungsstellung_ produziert das Event, sobald ein Verrechnungssatz für einen Auftrag gelöscht wurde.

## Feldname

`loescht_verrechnungssatz`

## Felder von `loescht_verrechnungssatz`

Der Verrechungssatz ist ein Value Object und wird über dessen Attribute eindeutig identifiziert.

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| `fuer_auftrag`  | [URI](https://tools.ietf.org/html/rfc3986)  | Pflicht  | Auftrag, für den der Verrechnungssatz geloescht wurde |
| `gueltig_ab`  | [ISO 8601 Kalendertag](https://en.wikipedia.org/wiki/ISO_8601)  | Pflicht  | Datum, ab dem der Verrechnungssatz für diesen Auftrag galt. Der davor geltende Verrechnungssatz gilt nun, bis ein weiterer gilt. |


## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| `rechnungsstellung.verrechnungssatz-fuer-auftrag-festgelegt` | `rechnungsstellung`  |
