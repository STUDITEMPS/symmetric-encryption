## Profilfoto festgelegt

## Bounded Kontext

Das Event "Profilfoto festgelegt" wird produziert, sobald ein Student ein Profilfoto in Jobmensa hochgeladen hat.

## Feldname

`legt_profilfoto_fest`

## Felder von legt_profilfoto_fest

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| fuer_student | URI | Pflicht  | Global eindeutige Identifikation des Studenten. |
| url | String | Pflicht  | Die öffentliche URL des Fotos |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenverwaltung.profilfoto-festgelegt | studentenverwaltung  |
