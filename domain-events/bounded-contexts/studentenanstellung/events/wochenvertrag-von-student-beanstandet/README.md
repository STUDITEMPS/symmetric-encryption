## Wochenvertrag von Student beanstandet

## Bounded Kontext

## Feldname

`beanstandet_wochenvertrag`

## Felder von beanstandet_wochenvertrag

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| @id | URI  | Pflicht  | Global eindeutige Identifikation (UUID) des Arbeitsvertrags. |
| version | Integer | Pflicht  | Version der Arbeitsvertrags |
| student | URI | Pflicht  | URI der Studenten, der im Vertrag steht |
| beanstandet_am | ISO 8601 Timestamp | Pflicht  | Gibt den Zeitpunkt der Beanstandung des Vertrags an. |


## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenanstellung.wochenvertrag-von-student-beanstandet | studentenanstellung |