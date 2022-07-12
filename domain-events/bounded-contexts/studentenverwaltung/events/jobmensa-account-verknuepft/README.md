## Jobmensa Account verknuepft

## Bounded Kontext

Kontext Studentenverwaltung wirft dieses Event, wenn der Jobvalley-Account eines Studenten mit einem
Jobmensa Account verknuepft wird. Das passiert, wenn sich ein Student, der sich zuerst über die App
einen Account angelegt hat, nachträglich noch einen Jobmensa Accaunt erstellt, und sich bewirbt.

## Feldname

`verknuepft_jobmensa_account`

### Felder von verknuepft_jobmensa_account

| Name             | Typ    | Pflichtfeld | Beschreibung                                    |
| --------------   | ------ | ----------- | ----------------------------------------------- |
| student          | URI    | Pflicht     | Global eindeutige Identifikation des Studenten. |
| jobmensa_student | URI    | Pflicht     | Jobmensa URI des Studenten.                     |
| email_adresse    | String | Pflicht     | Die Email Adresse des Studenten                 |

## Transport über RabbmitMQ

| Routing Key                                     | Exchange            |
| ----------------------------------------------- | ------------------- |
| studentenverwaltung.jobmensa-account-verknuepft | studentenverwaltung |
