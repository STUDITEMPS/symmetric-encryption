## Interesse an Jobvalley Job bekundet

Dieses Event wird vom Stammdaten-Kontext publiziert, wenn sich ein Student mit einem Jobvalley-Account auf eine Jobvalley-Anzeige beworben hat. Eine Anzeige bezieht sich immer auf einen Auftrag. Ein Student kann sich nur einmal auf einen Auftrag bewerben, Mehrfachbewerbungen sind nicht möglich.

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
