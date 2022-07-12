## Jobvalley Account angelegt

## Bounded Kontext

Kontext Studentenverwaltung wirft dieses Event, wenn der Jobvalley-Account eines Studenten angelegt wird.
Dieses Event befindet sich im Kontext Studentenverwaltung, obwohl es Stammdaten enthält, da
Studentenverwaltung der Kontext ist, in dem Erstellung/Löschung/Deaktivierung etc. von Accounts
verabeitet wird, und es hier hauptsächlich um die Existenz des Accounts geht.
Die Stammdaten sind als Summary mit dabei, damit andere Systeme sich diese nicht für jeden Studenten
über eine API holen müssen.

## Feldname

`legt_jobvalley_account_an`

### Felder von legt_jobvalley_account_an

| Name           | Typ    | Pflichtfeld | Beschreibung                                    |
| -------------- | ------ | ----------- | ----------------------------------------------- |
| student        | URI    | Pflicht     | Global eindeutige Identifikation des Studenten. |
| personalnummer | String | Pflicht     | Studitemps Personalnummer des Studenten.        |
| stammdaten     | String | Pflicht     | Summary für die Stammdaten des Studenten.       |

### Felder von stammdaten

| Name                 | Typ           | Pflichtfeld | Beschreibung                                                                  |
| -------------------- | ------------- | ----------- | ----------------------------------------------------------------------------- |
| vorname              | String        | Pflicht     | Der Vorname des Studenten.                                                    |
| nachname             | String        | Pflicht     | Der Nachname des Studenten.                                                   |
| email_adresse        | String        | Pflicht     | Die Email Adresse des Studenten                                               |
| mobilnummer          | String        | Pflicht     | Mobilnummer des Studenten mit abgetrennter Vorwahl (z.B. `+49 0221 23456789`) |
| geschlecht           | String        | Pflicht     | Das Geschlecht des Studenten                                                  |
| geburtsdatum         | ISO8601 Datum | Optional    | Das Geburtsdatum des Studenten                                                |
| staatsangehoerigkeit | URI           | Pflicht     | Identifikation des Staates in URI Format.                                     |
| anschrift            | Adresse       | Pflicht     | Die Anschrift des Studenten.                                                  |
| ist_student          | Boolean       | Pflicht     | Status des Studenten                                                          |

### Felder von anschrift

| Name         | Typ    | Pflichtfeld | Beschreibung |
| ------------ | ------ | ----------- | ------------ |
| straße       | String | Pflicht     | Straßenname  |
| hausnummer   | String | Pflicht     | Hausnummer   |
| postleitzahl | String | Pflicht     | Postleitzahl |
| stadt        | String | Pflicht     | Stadt        |
| land         | String | Pflicht     | Land         |
| zusatz       | String | Optional    | Adresszusatz |
| latitude     | String | Optional    | Latitude     |
| longitude    | String | Optional    | Longitude    |

## Transport über RabbmitMQ

| Routing Key                                    | Exchange            |
| ---------------------------------------------- | ------------------- |
| studentenverwaltung.jobvalley-account-angelegt | studentenverwaltung |
