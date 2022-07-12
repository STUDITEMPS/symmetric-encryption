## Langzeitvertrag-Kündigung Abgelehnt

## Bounded Kontext

## Feldname

`abgelehnte_vertragserstellung`

## Felder von abgelehnte_vertragserstellung

| Name | Typ  | Pflichtfeld  | Beschreibung |
|---|---|---|---|
| grund | String | Pflicht  | Warum konnte der Vertrag nicht gekündigt werden |
| vertrag | URI | Pflicht | URI des Vertrages |
| student | URI | Optional | URI des Studenten, der im Vertrag steht |
| gekuendigt_zum | ISO 8601 Timestamp | Pflicht | Das beabsichtigte Kündigungsdatum |
| kuendigungsgrund | String | Optional | Warum der Vertrag gekündigt werden sollte. |
| gekuendigt_von | URI | Pflicht | Die URI der kündigenden Vertragspartei |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenanstellung.langzeitvertrag-kuendigung-abgelehnt | studentenanstellung  |
