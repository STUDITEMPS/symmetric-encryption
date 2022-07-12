## Jobangebote per Telefon abgelehnt

## Bounded Kontext

Das Event "Jobangebote per Telefon abgelehnt" wird produziert,
sobald ein Student die telefonische Kontaktaufnahme für alternative Jobangebote abgelehnt hat.

## Feldname

`lehnt_angebote_ab`

## Felder von lehnt_angebote_ab

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| student | URI | Pflicht  | Global eindeutige Identifikation des Studenten. |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenverwaltung.jobangebote-per-telefon-abgelehnt | studentenverwaltung |
