## Name geaendert

## Bounded Kontext

Das Event "Name geaendert" wird produziert sobald ein Student seinen Namen (Vor- und/oder Nachname) angibt oder ändert.

## Feldname

`aendert_name`

## Felder von aendert_name

| Name | Typ | Pflichtfeld | Beschreibung |
|---|---|---|---|
| fuer_student | URI | Pflicht | Global eindeutige Identifikation des Studenten. |
| vorname | String | Pflicht | Vorname des Studenten |
| nachname | String | Pflicht | Nachname des Studenten |


## Transport über RabbmitMQ

| Routing Key | Exchange |
|---|---|
| studentenverwaltung.name-geaendert | studentenverwaltung |
