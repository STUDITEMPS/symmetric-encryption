## Arbeitszeit abgelehnt

## Bounded Kontext

Die _Freigabe_ produziert das Event, sobald eine Reklamation der Arbeitszeit von Kunden bekannt wird.
Später ist geplant, dass es nicht sofort passiert, sondern eine Konfliktlösung durchgeführt wird.

## Feldname

`lehnt_arbeitszeit_ab`

## Felder von `dokumentiert_nicht_stattgefundene_arbeitszeit`

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| `@id`  | [URI](https://tools.ietf.org/html/rfc3986)  | Pflicht  | Global eindeutige Identifikation der Arbeitszeit. |


## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| `freigabe.arbeitszeit-abgelehnt` | `freigabe` |
