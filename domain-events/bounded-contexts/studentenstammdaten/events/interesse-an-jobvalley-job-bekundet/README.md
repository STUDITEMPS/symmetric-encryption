## Interesse an Jobvalley Job bekundet

Dieses Event wird vom Stammdaten-Kontext publiziert, wenn sich ein Student mit einem Jobvalley-Account auf eine Jobvalley-Anzeige beworben hat.

## Feldname

`bekundet_interesse_an_jobvalley_job`

## Felder von bekundet_interesse_an_jobvalley_job

| Name | Typ | Pflichtfeld | Beschreibung |
|---|---|---|---|
| student | URI | Pflicht | Die URI des Studenten |
| fuer_auftrag | URI | Pflicht | Der Auftrag des jobvalley Jobs, für den eine Bewerbung eingereicht wird |

## Transport über RabbmitMQ

| Routing Key | Exchange |
|---|---|
| studentenstammdaten.interesse-an-jobvalley-job-bekundet | studentenstammdaten |
