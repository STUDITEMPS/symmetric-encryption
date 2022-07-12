## Rechnung storniert

## Bounded Kontext

Die _Rechnungsstellung_ produziert das Event, sobald eine Stornorechnung erzeugt und als PDF exportiert wurde.

Wenn eine bereits gestellte Rechnung storniert wird, dann wird dazu eine Stornorechnung erstellt, als PDF exportiert und diese PDF unter einer URL bereitgestellt. Stornorechnungen bedienen sich desselben Nummernkreises wie normale Rechnungen. Sie stornieren eine Rechnung immer vollständig und sind begrifflich von der Teilstorno(rechnung) abzugrenzen.

Manchmal wird eine Stornorechnung auch Vollstorno oder Stornobeleg genannt. Außerdem wird manchmal noch der Begriff Gutschrift fälschlicherweise synonym verwendet. Eine Gutschrift im umsatzsteuerrechtlichen Sinne ist eine vom Leistungsempfänger gestellte Rechnung und keine Stornorechnung.

## Feldname

`storniert_rechnung`

## Felder von `storniert_rechnung`

| Name           | Typ                                                            | Pflichtfeld | Beschreibung                                          |
| -------------- | -------------------------------------------------------------- | ----------- | ----------------------------------------------------- |
| `@id`          | [URI](https://tools.ietf.org/html/rfc3986)                     | Pflicht     | Identifikation der stornierten Rechnung               |
| `durch`        | [URI](https://tools.ietf.org/html/rfc3986)                     | Pflicht     | Identifikation der Stornorechnung.                       |
| `am_tag`       | [ISO 8601 Kalendertag](https://en.wikipedia.org/wiki/ISO_8601) | Pflicht     | Tag an dem die Rechnung storniert wurde               |
| `als_dokument` | [URL](https://tools.ietf.org/html/rfc3986)                     | Pflicht     | Ort an dem das Stornorechnungsdokument verfügbar ist. |

## Transport über RabbmitMQ

| Routing Key                            | Exchange            |
| -------------------------------------- | ------------------- |
| `rechnungsstellung.rechnung-storniert` | `rechnungsstellung` |
