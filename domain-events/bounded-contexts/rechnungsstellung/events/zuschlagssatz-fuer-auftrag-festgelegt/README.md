## Zuschlagssatz für Auftrag festgelegt

## Bounded Kontext

Die _Rechnungsstellung_ produziert das Event, sobald ein Zuschlagssatz für einen Auftrag festgelegt wurde.

## Feldname

`dokumentiert_zuschlagssatz`

## Felder von `dokumentiert_zuschlagssatz`

Der Zuschlagssatz ist ein Value Object und wird über dessen Attribute eindeutig identifiziert.

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| `enthaelt_zuschlaege` | Liste  | Pflicht  | Liste von Zuschlägen, die der Zuschlagssatz enthält|
| `fuer_auftrag`  | [URI](https://tools.ietf.org/html/rfc3986)  | Pflicht  | Auftrag, für den der Zuschlagssatz festgelegt wurde |
| `gueltig_ab`  | [ISO 8601 Kalendertag](https://en.wikipedia.org/wiki/ISO_8601) | Pflicht  | Datum, ab dem der Zuschlagssatz für diesen Auftrag gilt. Der Zuschlagssatz gilt so lange, bis ein anderer Zuschlagssatz gilt. Auch hier ist, wie beim Verrechnungssatz, der Tag des Schichtbeginns eines Studenten ausschlaggebend. |

### Felder der `enthaelt_zuschlaege`

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| `hat_voraussetzungen`  | Object  | Pflicht  | Voraussetzungen, die erfüllt sein müssen, damit der Zuschlag für eine Arbeitszeit/Schicht berechnet wird. Kann nur beim Mehrarbeitszuschlag leer/nicht vorhanden sein. |
| `hat_konsequenz`  | Object  | Pflicht  | Konsequenz, die gezogen wird, wenn der Zuschlag gilt |

### Felder der `hat_voraussetzungen`

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| `gilt_von`  | [ISO 8601 Timestamp](https://en.wikipedia.org/wiki/ISO_8601)  | Optional  | Uhrzeit, ab die der Zuschlag gilt |
| `gilt_bis`  | [ISO 8601 Timestamp](https://en.wikipedia.org/wiki/ISO_8601)  | Optional  | Uhrzeit, bis zu der der Zuschlag gilt |
| `gilt_an_wochentag`  | [ISO 8601 Wochentagsnummer](https://en.wikipedia.org/wiki/ISO_8601)  | Optional  | Wochentag, an denen der Zuschlag gilt |
| `gilt_ab_dauer_in_minuten_von`  | Integer  | Optional  | 	Mindestarbeitszeitdauer in Minuten, die innerhalb des Gültigkeitszeitraums erreicht sein muss, damit der Zuschlag ab der 1. Minute berechnet wird |
| `@type`  | [URI](https://tools.ietf.org/html/rfc3986)  | Pflicht  | Typ der Voraussetzung, damit man nicht den Namen benutzen muss.
Mögliche Auspregungen: 
  * `tech.studitemps:rechnungsstellung:zuschlag:feiertagsvoraussetzung`
  * `tech.studitemps:rechnungsstellung:zuschlag:mehrarbeitsvoraussetzung`
  * `tech.studitemps:rechnungsstellung:zuschlag:taegliche-voraussetzung`
  * `tech.studitemps:rechnungsstellung:zuschlag:wochentagsvoraussetzung` |

### Felder der `hat_konsequenz`

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| `wert_in_cent`  | Integer  | Optional  | Centbetrag, der für Arbeitszeit, für die Zuschlag anfällt, zusätzlich zum Verrechnungssatz berechnet wird |
| `wert_in_prozent`  | Float  | Optional  | Prozentwert von Verrechnungssatz, der für Arbeitszeit, für die Zuschlag anfällt, zusätzlich zum Verrechnungssatz berechnet wird |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| `rechnungsstellung.zuschlagssatz-fuer-auftrag-festgelegt` | `rechnungsstellung`  |
