## Unternehmensaccount angelegt

## Bounded Kontext

## Feldname

`legt_unternehmensaccount_an`

## Felder von legt_unternehmensaccount_an

| Name                  | Typ              | Pflichtfeld | Beschreibung                                                                                                                   |
| --------------------- | ---------------- | ----------- | ------------------------------------------------------------------------------------------------------------------------------ |
| @id                   | URI              | Pflicht     | Die URI des neuen Unternehmensaccounts |
| email                 | String           | Pflicht     | Email Adresse des neuen Accounts |
| accounttyp            | String           | Pflicht     | Typ des Accounts. Entweder `company` oder `private_person` |
| unternehmensname      | String           | Optional    | Name des Unternehmens, ausgefüllt falls accounttyp `company` |
| vorname               | String           | Optional    | Vorname der Privatperson/des Ansprechpartners beim Unternehmen (falls vorhanden) |
| nachname              | String           | Optional    | Nachname der Privatperson/des Ansprechpartners beim Unternehmen (falls vorhanden) |

## Transport über RabbmitMQ

| Routing Key                                | Exchange |
| ------------------------------------------ | -------- |
| anzeigenkunden.unternehmensaccount-angelegt | jobmensa |
