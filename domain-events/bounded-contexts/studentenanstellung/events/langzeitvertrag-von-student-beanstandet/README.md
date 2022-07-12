## Langzeitvertrag von Student beanstandet

## Bounded Kontext

## Feldname

`beanstandet_langzeitvertrag`

## Felder von beanstandet_langzeitvertrag

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| @id | URI  | Pflicht  | Global eindeutige Identifikation (UUID) des Arbeitsvertrags. |
| version | Integer | Pflicht  | Version der Arbeitsvertrags |
| vertragsnummer | String | Pflicht | Nummer des Vertragsdokuments |
| student | URI | Pflicht  | URI der Studenten, der im Vertrag steht |
| beanstandet_am | ISO 8601 Timestamp | Pflicht  | Gibt den Zeitpunkt der Beanstandung des Vertrags an. |


## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenanstellung.langzeitvertrag-von-student-beanstandet | studentenanstellung |