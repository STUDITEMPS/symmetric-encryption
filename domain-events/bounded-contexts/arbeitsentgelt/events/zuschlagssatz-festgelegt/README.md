## Zuschlagssatz festgelegt

## Bounded Kontext

Das _Arbeitsentgelt_ produziert das Event, sobald ein Zuschlagssatz für einen Auftrag festgelegt wurde. Wird kein Zuschlagssatz explizit festgelegt (oder alle festgelegten gelöscht), gilt der _iGZ-Standard_-Zuschlagssatz als Default-Zuschlagssatz.

Der Standardzuschlagssatz enthält die folgenden Zuschläge:

1. sonntags: 50%
2. an Feiertagen: 100%
3. Mehrarbeit: 25%
4. täglich von 23:00 bis 06:00 bei einer Mindestdauer der Arbeitszeit von 2 Stunden: 25%

## Feldname

`dokumentiert_zuschlagssatz`

### Felder von `dokumentiert_zuschlagssatz`

| Name | Typ  | Pflichtfeld  | Beschreibung |
|---|---|---|---|
| `enthaelt_zuschlaege` | Liste | Pflicht | Liste von Zuschlägen, die der Zuschlagssatz enthält |
| `fuer_auftra`g | [URI](https://tools.ietf.org/html/rfc3986) | Pflicht | Auftrag, für den der Zuschlagssatz festgelegt wurde |
| `gueltig_ab` | [ISO 8601 Kalendertag](https://en.wikipedia.org/wiki/ISO_8601) | Pflicht | Datum, ab dem der Zuschlagssatz für diesen Auftrag gilt. Der Zuschlagssatz gilt so lange, bis ein anderer Zuschlagssatz gilt. Auch hier ist, wie beim Stundenlohn, der Tag des Schichtbeginns eines Studenten ausschlaggebend. |

### Felder der `enthaelt_zuschlaege`

| Name | Typ  | Pflichtfeld  | Beschreibung |
|---|---|---|---|
| `hat_voraussetzungen` | Object | Pflicht | Voraussetzungen, die erfüllt sein müssen, damit der Zuschlag für eine Arbeitszeit/Schicht ausgezahlt wird. |
| `hat_konsequenz` | Object | Pflicht | Konsequenz, die gezogen wird, wenn der Zuschlag gilt |

### Felder der `hat_voraussetzungen`

| Name | Typ  | Pflichtfeld  | Beschreibung |
|---|---|---|---|
| `gilt_von` | [ISO 8601 Timestamp](https://en.wikipedia.org/wiki/ISO_8601) | Optional | Uhrzeit, ab die der Zuschlag gilt |
| `gilt_bis` | [ISO 8601 Timestamp](https://en.wikipedia.org/wiki/ISO_8601) | Optional | Uhrzeit, bis zu der der Zuschlag gilt |
| `gilt_an_wochentag` | [ISO 8601 Wochentagsnummer](https://en.wikipedia.org/wiki/ISO_8601) | Optional | Wochentag, an denen der Zuschlag gilt |
| `gilt_ab_dauer_in_minuten_von` | Integer | Optional | Mindestarbeitszeitdauer in Minuten, die innerhalb des Gültigkeitszeitraums erreicht sein muss, damit der Zuschlag ab der 1. Minute ausgezahlt wird |
| `@type` | String | Pflicht | Typ der Voraussetzung, damit man nicht den Namen benutzen muss.
Mögliche Ausprägungen:
  * `tech.studitemps:arbeitsentgelt:zuschlag:feiertagsvoraussetzung`
  * `tech.studitemps:arbeitsentgelt:zuschlag:mehrarbeitsvoraussetzung`
  * `tech.studitemps:arbeitsentgelt:zuschlag:taegliche-voraussetzung`
  * `tech.studitemps:arbeitsentgelt:zuschlag:wochentagsvoraussetzung` |


### Felder der `hat_konsequenz`

| Name | Typ  | Pflichtfeld  | Beschreibung |
|---|---|---|---|
| `wert_in_cent` | Integer | Optional | Euro Centbetrag, der für Arbeitszeit, für die Zuschlag anfällt, zusätzlich zum Stundenlohn berechnet wird |
| `wert_in_prozent` | Float | Optional | Prozentwert vom Tariflohn, der für die Arbeitszeit, für die der Zuschlag anfällt, zusätzlich zum Stundenlohn ausgezahlt wird |


## Transport über RabbmitMQ

| Routing Key | Exchange |
|---|---|
| `arbeitsentgelt.zuschlagssatz-festgelegt` | `arbeitsentgelt` |
