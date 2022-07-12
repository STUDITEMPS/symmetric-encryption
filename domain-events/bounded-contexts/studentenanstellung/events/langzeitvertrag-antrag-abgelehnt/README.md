## Langzeitvertrag-Antrag Abgelehnt

## Bounded Kontext

## Feldname

`lehnt_vertragsantrag_ab`

## Felder von lehnt_vertragsantrag_ab

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| grund | String | Pflicht  | Warum konnte der Vertrag nicht erstellt werden |
| student | URI | Pflicht | URI des Studenten, der im Vertrag steht |
| personalnummer | String | Pflicht | Personalnummer des Studenten |
| von | ISO 8601 Timestamp | Pflicht | Datum ab wann der Vertrag gelten soll |
| bis | ISO 8601 Timestamp | Pflicht | Datum wann der Vertrag enden soll |
| wochenstunden | Decimal | Pflicht | Anzahl der zu leistenden Wochenstunden |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenanstellung.langzeitvertrag-abgelehnt | studentenanstellung  |