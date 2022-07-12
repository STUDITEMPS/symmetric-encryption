## Verfügbarkeit angegeben

## Bounded Kontext

Das Event "Wochenarbeitszeit angegeben" wird produziert sobald ein Student seine Wochenarbeitszeit angegeben hat.

## Feldname

`gibt_wochenarbeitszeit_an`

## Felder von gibt_wochenarbeitszeit_an

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| student | URI | Pflicht  | Global eindeutige Identifikation des Studenten. |
| arbeitszeit | ISO 8601 Duration | Pflicht  | Gewünschte Wochenarbeitszeit |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenverwaltung.wochenarbeitszeit-angegeben | studentenverwaltung  |
