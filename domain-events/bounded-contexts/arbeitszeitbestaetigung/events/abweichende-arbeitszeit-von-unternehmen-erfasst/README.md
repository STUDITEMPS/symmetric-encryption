# Abweichende Arbeitszeit von Unternehmen erfasst

## Bounded Kontext

Der Kontext produziert das Event sobald ein Unternehmen eine (zu der vom Studenten eingetragenen) abweichende Arbeitszeit erfasst.

## Feldname

`erfasst_abweichende_arbeitszeit`

## Felder von dokumentiert_arbeitszeit

| Name                 | Typ                                                                       | Pflichtfeld | Beschreibung                                                                                                                                                      |
| -------------------- | ------------------------------------------------------------------------- | ----------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `gegenbehauptung_zu` | [URI](https://tools.ietf.org/html/rfc3986)                                | Pflicht     | Global eindeutige Identifikation der originären, vom Studenten angegebenen Arbeitszeit.                                                                           |
| `@id`                | [URI](https://tools.ietf.org/html/rfc3986)                                | Pflicht     | Global eindeutige Identifikation der abweichenden Arbeitszeit.                                                                                                    |
| `in_zeitraum`        | [ISO8601 Interval](https://en.wikipedia.org/wiki/ISO_8601#Time_intervals) | Pflicht     | Gibt den Zeitraum für die Arbeitszeit an. Enthält Datum und sekundengenaue Uhrzeit mit Zeitzone Offset getrennt durch ein `/`                                     |
| `enthielt_pausen`    | Liste aus ISO 8601 Intervallen                                            | Optional    | Beliebig viele Pausen während der Arbeitszeit. Format siehe fand_im_interval_statt. **Achtung:** nur enthalten, wenn die genaue Verortung der Pausen bekannt ist. |
| `gesamtpausendauer`  | [ISO8601 Duration](https://en.wikipedia.org/wiki/ISO_8601#Durations)      | Pflicht     | Gesamtdauer aller Pausen, die innerhalb der Arbeitszeit stattfanden.                                                                                              |
| `von_student`        | [URI](https://tools.ietf.org/html/rfc3986)                                | Pflicht     | Global eindeutige Identifikation des Studenten.                                                                                                                   |
| `in_auftrag`         | [URI](https://tools.ietf.org/html/rfc3986)                                | Pflicht     | Global eindeutige Identifikation des Auftrags.                                                                                                                    |
| `in_schicht`         | [URI](https://tools.ietf.org/html/rfc3986)                                | Optional    | Global eindeutige Identifikation der Schicht.                                                                                                                     |

## Transport über RabbmitMQ

| Routing Key                                                               | Exchange                  |
| ------------------------------------------------------------------------- | ------------------------- |
| `arbeitszeitbestaetigung.abweichende-arbeitszeit-von-unternehmen-erfasst` | `arbeitszeitbestaetigung` |
