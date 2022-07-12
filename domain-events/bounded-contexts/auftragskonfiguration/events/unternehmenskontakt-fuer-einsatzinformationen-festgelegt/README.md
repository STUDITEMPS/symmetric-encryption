## Bounded Kontext

Die Auftragskonfiguration produziert das Event, sobald der Unternehmenskontakt, der den Student:innen als direkte:r Ansprechpartner:in mitgeteilt wird, festgelegt wird. Der Unternehmenskontakt kann jederzeit geändert werden.

## Felder des Events

| Name                                                    | Typ    | Pflichtfeld | Beschreibung                    |
| ------------------------------------------------------- | ------ | ----------- | ------------------------------- |
| legt_unternehmenskontakt_fuer_einsatzinformationen_fest | Object | Pflicht     | Unternehmenskontakt und Auftrag |

## Felder von legt_unternehmenskontakt_fuer_einsatzinformationen_fest

| Name         | Typ    | Pflichtfeld | Beschreibung                                              |
| ------------ | ------ | ----------- | --------------------------------------------------------- |
| fuer_auftrag | URI    | Pflicht     | Auftrag, für den der Unternehmenskontakt festgelegt wurde |
| anrede       | String | Optional    | kann nur "Herr" oder "Frau" sein                          |
| vorname      | String | Pflicht     | Vorname des Unternehmenskontakts                          |
| nachname     | String | Pflicht     | Nachname des Unternehmenskontakts                         |
| email        | String | Pflicht     | E-Mail-Adresse des Unternehmenskontakts                   |

## Transport über RabbmitMQ

| Routing Key                                                                    | Exchange              |
| ------------------------------------------------------------------------------ | --------------------- |
| auftragskonfiguration.unternehmenskontakt-fuer-einsatzinformationen-festgelegt | auftragskonfiguration |
