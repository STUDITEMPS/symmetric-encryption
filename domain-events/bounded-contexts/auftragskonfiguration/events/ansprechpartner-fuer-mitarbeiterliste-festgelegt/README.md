## Bounded Kontext

Die Auftragskonfiguration produziert das Event, sobald der Ansprechparter (im Unternehmen) für die Mitarbeiterliste für einen Auftrag festgelegt wird. Der Ansprechpartner kann jederzeit geändert werden.

## Felder des Events

| Name                                            | Typ    | Pflichtfeld | Beschreibung                    |
| ----------------------------------------------- | ------ | ----------- | ------------------------------- |
| legt_ansprechpartner_fuer_mitarbeiterliste_fest | Object | Pflicht     | Unternehmenskontakt und Auftrag |

## Felder von legt_ansprechpartner_fuer_mitarbeiterliste_fest

| Name         | Typ    | Pflichtfeld | Beschreibung                                              |
| ------------ | ------ | ----------- | --------------------------------------------------------- |
| fuer_auftrag | URI    | Pflicht     | Auftrag, für den der Unternehmenskontakt festgelegt wurde |
| email        | String | Pflicht     | E-Mail-Adresse des Ansprechpartners im Unternehmen        |

## Transport über RabbmitMQ

| Routing Key                                                            | Exchange              |
| ---------------------------------------------------------------------- | --------------------- |
| auftragskonfiguration.ansprechpartner-fuer-mitarbeiterliste-festgelegt | auftragskonfiguration |
