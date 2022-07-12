## Arbeitszeit durch stille Zustimmung von Unternehmen bestätigt

## Bounded Kontext

_Freigabe_

## Beschreibung

Die _Freigabe_ produziert das Event, wenn eine [Arbeitszeitbestätigung von Unternehmen angefordert wurde](../bestaetigung-fuer-arbeitszeit-von-unternehmen-angefordert/README.md) und das Unternehmen die _Widerspruchtsfrist_ verstreichen lässt.
Das Event wird also geworfen, wenn das Unternehmen in der von jobvalley vorgegebenen Zeit weder die [Arbeitszeit des Arbeitnehmers bestätigt](../../../arbeitszeitbestaetigung/events/arbeitszeit-von-unternehmen-bestaetigt/README.md) noch der Aussage des Arbeitnehmers durch die [Erfassung einer abweichenden Arbeitszeit](../../../arbeitszeitbestaetigung/events/abweichende-arbeitszeit-von-unternehmen-erfasst/README.md) oder durch die [Ablehnung gesamter Arbeitszeit](../../../arbeitszeitbestaetigung/events/noshow-von-unternehmen-gemeldet/README.md) widersprochen hat.

## Feldname

`bestaetigt_arbeitszeit`

## Felder von `bestaetigt_arbeitszeit`

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| `@id`  | [URI](https://tools.ietf.org/html/rfc3986)  | Pflicht  | Global eindeutige Identifikation der Arbeitszeit. |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| `freigabe.arbeitszeit-durch-stille-zustimmung-von-unternehmen-bestaetigt` | `freigabe`  |
