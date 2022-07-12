## Geburtsdatum geaendert

## Bounded Kontext

Das Event "Geburtsdatum geaendert" wird produziert sobald ein Student sein Geburtsdatum angibt oder ändert.

## Feldname

`aendert_geburtsdatum`

## Felder von aendert_geburtsdatum

| Name | Typ | Pflichtfeld | Beschreibung |
|---|---|---|---|
| fuer_student | URI | Pflicht | Global eindeutige Identifikation des Studenten. |
| geburtsdatum | ISO 8601 Date | Pflicht | Geburtsdatum des Studenten |


## Transport über RabbmitMQ

| Routing Key | Exchange |
|---|---|
| studentenverwaltung.geburtsdatum-geaendert | studentenverwaltung |
