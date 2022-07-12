## Arbeitszeit gelöscht

## Bounded Kontext

Die _Freigabe_ produziert das Event, sobald eine Arbeitszeit dort gelöscht wurde. Der Eventname enthält mit Absicht wenig fachliches, da es derzeit eine Art "catch-all" Event ist und wir nicht wissen, welche Intention (von Student oder Unternehmen gewollt?; aus welchem Grund?) hinter dem Löschen steckt.

## Feldname

`loescht_arbeitszeit`

## Felder von `loescht_arbeitszeit`

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| `@id`  | [URI](https://tools.ietf.org/html/rfc3986)  | Pflicht  | Global eindeutige Identifikation des Events. |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| `freigabe.arbeitszeit-geloescht` | `freigabe`  |
