## Telefonnummer geaendert

## Bounded Kontext

Das Event "Telefonnummer geaendert" wird produziert sobald ein Student seine Telefonnummer angibt oder ändert.

## Feldname

`aendert_telefonnummer`

## Felder von aendert_telefonnummer

| Name | Typ | Pflichtfeld | Beschreibung |
|---|---|---|---|
| fuer_student | URI | Pflicht | Global eindeutige Identifikation des Studenten. |
| telefonnummer | String | Pflicht | Telefonnummer des Studenten mit Landesvorwahl (z.B. +49151234567890) |


## Transport über RabbmitMQ

| Routing Key | Exchange |
|---|---|
| studentenverwaltung.telefonnummer-geaendert | studentenverwaltung |
