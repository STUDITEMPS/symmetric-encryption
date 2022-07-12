## Jobangeboten per Telefon zugestimmt

## Bounded Kontext

Das Event "Jobangeboten per Telefon zugestimmt" wird produziert,
sobald ein Student der telefonischen Kontaktaufnahme für alternative Jobangebote zugestimmt hat.

## Feldname

`stimmt_angeboten_zu`

## Felder von stimmt_angeboten_zu

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| student | URI | Pflicht  | Global eindeutige Identifikation des Studenten. |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenverwaltung.jobangeboten-per-telefon-zugestimmt | studentenverwaltung |
