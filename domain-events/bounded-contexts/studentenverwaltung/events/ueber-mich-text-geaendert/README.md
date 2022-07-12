## Ueber mich-Text geaendert

## Bounded Kontext

Das Event "Ueber mich-Text geaendert" wird produziert,
sobald ein Student seinen Über mich-Profiltext ändert oder zum ersten Mal ausfüllt.

## Feldname

`aendert_text`

## Felder von aendert_text

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| fuer_student | URI | Pflicht  | Global eindeutige Identifikation des Studenten. |
| ueber_mich | String | Pflicht  | Über mich-Text des Studenten. |


## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenverwaltung.ueber-mich-text-geaendert | studentenverwaltung |
