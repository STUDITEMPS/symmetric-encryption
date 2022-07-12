## Arbeitszeit um Zusatz erweitert

## Bounded Kontext

Die _Freigabe_ produziert das Event, wenn für eine Arbeitszeit ein Zusatz erhoben wird, z. B. Kostenstelle, Einsatzbereich oder die Filiale. Diese Zusätze beziehen sich auf das Einsatzunternehmen und wir können nur annehmen, um welche Informationen es sich dabei handelt.
Diese Zusätze werden dazu genutzt, um die künftige Kundenrechnung danach zu splitten(z.B. eigene Rechnung pro Einsatzbereich oder pro Filiale).

## Feldname

`erweitert_arbeitszeit`

## Felder von `erweitert_arbeitszeit`

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| `@id`  | [URI](https://tools.ietf.org/html/rfc3986)  | Pflicht  | Global eindeutige Identifikation der Arbeitszeit. |
| `mit_zusatz`  | String oder `null`  | Pflicht  | Zusatz als String, oder `null`, damit man die Zusätze wieder löschen kann |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| `timetracking.arbeitszeit-um-zusatz-erweitert` | `freigabe`  |
