## Langzeitvertrag durch Student gekündigt

## Bounded Kontext

## Feldname

`dokumentiert_langzeitvertrag_gekuendigt`

## Felder von dokumentiert_langzeitvertrag_gekuendigt

| Name | Typ  | Pflichtfeld  | Beschreibung |
|---|---|---|---|
| @id | URI | Pflicht  | Global eindeutige Identifikation des Arbeitsvertrags |
| kuendigungsgrund | String	 | Optional | Grund für die Kündigung |
| student | URI | Optional | URI des Studenten, der im Vertrag steht |
| gekuendigt_zum | ISO 8601 Timestamp | Pflicht | Datum zu dem der Vertrag gekündigt wird. Muss ein Sonntag sein! |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenanstellung.langzeitvertrag-durch-student-gekuendigt | **shinobi**  |
