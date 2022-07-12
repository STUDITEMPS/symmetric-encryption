## Bestätigung für Arbeitszeit von Unternehmen angefordert

## Bounded Kontext

Die _Freigabe_ produziert dieses Event, sobald ein [Arbeitszeit von Student erfasst](../../../studentenzeiterfassung/events/arbeitszeit-von-student-erfasst/README.md) Event ausgelöst wurde.
_Freigabe_ erwartet vom [Arbeitszeitbestaetigung](../../../arbeitszeitbestaetigung/README.md) Context eine Antwort auf dieses Event.
Falls innerhalb der Widerspruchsfrist (siehe Feld `mit_widerspruchsfrist`) keine Antwort von _Arbeitszeitbestaetigung_ eingegangen ist,
wird _Freigabe_ mit [Arbeitszeit durch stille Zustimmung von Unternehmen bestätigt](../arbeitszeit-durch-stille-zustimmung-von-unternehmen-bestaetigt/README.md) reagieren.

## Feldname

`fordert_bestaetigung_fuer_arbeitszeit_von_unternehmen_an`

## Felder von `fordert_bestaetigung_fuer_arbeitszeit_von_unternehmen_an`

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| `@id`  | [URI](https://tools.ietf.org/html/rfc3986)  | Pflicht  | Global eindeutige Identifikation der Arbeitszeit. |
| `initial_erfasste_arbeitszeit`  | [URI](https://tools.ietf.org/html/rfc3986)  | Pflicht  | Arbeitszeiten können durch verschiedene Aktionen mehrmals korrigiert werden. Wir erstellen für jede Änderung einen neue Arbeitszeit. In diesem Feld steht die initial erfasste Arbeitszeit. |
| `fand_im_auftrag_statt`  | [URI](https://tools.ietf.org/html/rfc3986) | Pflicht  | Global eindeutige Identifikation des Auftrags.|
| `geleistet_von`  | [URI](https://tools.ietf.org/html/rfc3986) | Pflicht  | Global eindeutige Identifikation des Studenten.|
| `disponiert_in`  | [URI](https://tools.ietf.org/html/rfc3986) | Optional  | Global eindeutige Identifikation der Schicht, falls bekannt.|
| `fand_im_intervall_statt`  | [ISO8601 Interval](https://en.wikipedia.org/wiki/ISO_8601#Time_intervals) | Pflicht  | Gibt Start und Ende der Arbeitszeit an. Enthält Datum und sekundengenaue Uhrzeit mit Zeitzone Offset getrennt durch ein / |
| `enthielt_pausen`  | Liste aus [ISO 8601 Intervallen](https://en.wikipedia.org/wiki/ISO_8601#Time_intervals) | Optional  | Beliebig viele Pausen während der Arbeitszeit. Format siehe fand_im_interval_statt. **Achtung:** nur enthalten, wenn die genaue Verortung der Pausen bekannt ist.|
| `hatte_gesamtpausendauer`  | [ISO8601 Duration](https://en.wikipedia.org/wiki/ISO_8601#Durations) | Pflicht  | Gesamtdauer aller Pausen, die innerhalb der Arbeitszeit stattfanden. |
| `mit_widerspruchsfrist` | [ISO 8601 Zeit + Datum](https://en.wikipedia.org/wiki/ISO_8601) | Pflicht | Wie lange wird auf die Prüfung der Arbeitszeit gewartet? Falls bis zu diesem Zeitpunkt keine Bestätigung oder Ablehnung eingetroffen ist, kann die Freigabe von einer stillen Zustimmung ausgehen. |

Es wird grundsätzlich die deutsche Zeitzone angenommen.

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| `freigabe.bestaetigung-fuer-arbeitszeit-von-unternehmen-angefordert` | `freigabe`  |
