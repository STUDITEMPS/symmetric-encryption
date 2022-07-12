## Jobmensa Account gelöscht

## Bounded Kontext

Das Event "Jobmensa Account gelöscht" wird produziert sobald ein Student seinen Account auf Jobmensa gelöscht hat.

## Feldname

`loescht_jobmensa_account`

## Felder von gibt_verfuegbarkeit_an

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| @id | URI | Pflicht  | Global eindeutige Identifikation des Studenten. |
| loeschzeitpunkt | ISO 8601 Zeit + Datum | Pflicht  | Zeitpunkt der Löschung |
| loeschgrund | String | Pflicht  | Grund der Löschung ("Student" oder Cronjob, etc.) |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenverwaltung.jobmensa-account-geloescht | studentenverwaltung  |
