## Rechnung gestellt

## Bounded Kontext

Die _Rechnungsstellung_ produziert das Event, sobald eine Rechnung erzeugt und exportiert wurde.

## Feldname

`stellt_rechnung`

## Felder von `stellt_rechnung`

| Name                        | Typ                                                                       | Pflichtfeld | Beschreibung                                                                                                           |
| --------------------------- | ------------------------------------------------------------------------- | ----------- | ---------------------------------------------------------------------------------------------------------------------- |
| `@id`                       | [URI](https://tools.ietf.org/html/rfc3986)                                | Pflicht     | Identifikation der Rechnung                                                                                            |
| `fuer_auftrag`              | [URI](https://tools.ietf.org/html/rfc3986)                                | Pflicht     | Auftrag, für den die Rechnung gestellt wurde                                                                           |
| `am_tag`                    | [ISO 8601 Kalendertag](https://en.wikipedia.org/wiki/ISO_8601)            | Pflicht     | Tag an dem die Rechnung gestellt wurde                                                                                 |
| `mit_faelligkeit`           | [ISO 8601 Kalendertag](https://en.wikipedia.org/wiki/ISO_8601)            | Pflicht     | Tag an dem die Rechnung bezahlt sein muss                                                                              |
| `mit_zahlbetrag_in_cent`    | Integer                                                                   | Pflicht     | Der vom Debitor zu zahlende Betrag in Euro Cent.                                                                       |
| `an_leistungsempfaenger`    | [URI](https://tools.ietf.org/html/rfc3986)                                | Pflicht     | Identifikation des Leistungsempfängers. Entweder URI eines Kunden oder URI eines Debitors (wenn kein Kunde existiert). |
| `ueber_abrechnungszeitraum` | [ISO8601 Interval](https://en.wikipedia.org/wiki/ISO_8601#Time_intervals) | Pflicht     | Der Leistungszeitraum der abgerechnet wird.                                                                            |
| `als_dokument`              | [URL](https://tools.ietf.org/html/rfc3986)                                | Pflicht     | Ort an dem das Rechnungsdokument verfügbar ist.                                                                        |

## Transport über RabbmitMQ

| Routing Key                           | Exchange            |
| ------------------------------------- | ------------------- |
| `rechnungsstellung.rechnung-gestellt` | `rechnungsstellung` |
