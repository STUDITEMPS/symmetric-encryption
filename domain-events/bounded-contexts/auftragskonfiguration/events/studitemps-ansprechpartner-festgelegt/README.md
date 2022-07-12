## Bounded Kontext

Die Auftragskonfiguration produziert das Event, sobald der jobvalley Ansprechpartner für einen Auftrag festgelegt wird. Der Ansprechpartner kann jederzeit geändert werden. Bei Änderung kommt ein neues Festgelegt-Event, dieser neue Ansprechpartner ersetzt den vorherigen.

Ein jobvalley Mitarbeiter ist hauptverantworlich für einen Auftrag als Ansprechpartner für Kunden und Studenten, die sich bei ihm melden können, wenn sie Fragen oder Probleme haben. Dieser Ansprechpartner wird hier kommuniziert.

Ein jobvalley Mitarbeiter kann seine Daten (außer E-Mail-Adresse) jederzeit anpassen. Dafür gibt es kein Domain Event.

## Felder des Events

| Name                                 | Typ    | Pflichtfeld | Beschreibung                           |
| ------------------------------------ | ------ | ----------- | -------------------------------------- |
| legt_studitemps_ansprechpartner_fest | Object | Pflicht     | jobvalley Ansprechpartner und Auftrag |

## Felder von legt_studitemps_ansprechpartner_fest

| Name          | Typ    | Pflichtfeld | Beschreibung                                                                                                        |
| ------------- | ------ | ----------- | ------------------------------------------------------------------------------------------------------------------- |
| fuer_auftrag  | URI    | Pflicht     | Auftrag, für den der jobvalley Mitarbeiter festgelegt wurde                                                        |
| email         | String | Pflicht     | E-Mail-Adresse des jobvalley Mitarbeiters                                                                          |
| nachname      | String | Pflicht     | Nachname des jobvalley Mitarbeiters                                                                                |
| vorname       | String | Pflicht     | Vorname des jobvalley Mitarbeiters                                                                                 |
| anrede        | String | Optional    | Anrede, kann nur "Herr" oder "Frau" sein                                                                            |
| telefonnummer | String | Optional    | Telefonnummer des jobvalley Mitarbeiters mit abgetrennter Vorwahl und optionaler Durchwahl (z.B. 0221 23456789-01) |

## Transport über RabbmitMQ

| Routing Key                                                 | Exchange              |
| ----------------------------------------------------------- | --------------------- |
| auftragskonfiguration.studitemps-ansprechpartner-festgelegt | auftragskonfiguration |
