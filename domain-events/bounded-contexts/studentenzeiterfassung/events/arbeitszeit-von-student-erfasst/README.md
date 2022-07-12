## Arbeitszeit von Student erfasst

## Bounded Kontext

Die Studentenzeiterfassung produziert das Event sobald ein Student die geleistete Arbeitszeit erfasst.

## Feldname

`dokumentiert_arbeitszeit`

## Felder von dokumentiert_arbeitszeit

| Name | Typ  | Pflichtfeld  | Beschreibung |
|---|---|---|---|
| @id | URI | Pflicht | Global eindeutige Identifikation der Arbeitszeit. |
| geleistet_von | URI | Pflicht | Global eindeutige Identifikation des Studenten. |
| fand_im_intervall_statt | ISO 8601 Intervall | Pflicht | Gibt Start und Ende der Arbeitszeit an. Enthält Datum und sekundengenaue Uhrzeit mit Zeitzone Offset getrennt durch ein / |
| enthielt_pausen | Liste aus ISO 8601 Intervallen | Optional | Beliebig viele Pausen während der Arbeitszeit. Format siehe fand_im_interval_statt |
| fuer_schicht | URI | Optional | Global eindeutige Identifikation der zugehörigen Schicht |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenzeiterfassung.arbeitszeit-von-student-erfasst | studentenzeiterfassung |