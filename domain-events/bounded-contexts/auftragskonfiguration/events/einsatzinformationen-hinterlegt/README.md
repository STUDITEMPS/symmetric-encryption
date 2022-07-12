## Bounded Kontext

Die Auftragskonfiguration produziert das Event, sobald die "Wichtige Informationen für die Einsatzmeldung" in Staffing hinterlegt oder gändert werden.

## Felder des Events

| Name                                            | Typ    | Pflichtfeld | Beschreibung                    |
| ----------------------------------------------- | ------ | ----------- | ------------------------------- |
| hinterlegt_einsatzinformationen | Object | Pflicht     | Auftrag und Text |

## Felder von legt_ansprechpartner_fuer_mitarbeiterliste_fest

| Name         | Typ    | Pflichtfeld | Beschreibung                                              |
| ------------ | ------ | ----------- | --------------------------------------------------------- |
| fuer_auftrag | URI    | Pflicht     | Auftrag, für den der Unternehmenskontakt festgelegt wurde |
| text_html        | String | Pflicht     | Der Text der Einsatzinformationen mit HTML Tags|

## Mögliche HTML Tags

- a
- br
- del
- div
- em
- figcaption
- figure
- h3
- hr
- li
- ol
- p
- strong
- ul

## Transport über RabbmitMQ

| Routing Key                                                            | Exchange              |
| ---------------------------------------------------------------------- | --------------------- |
| auftragskonfiguration.einsatzinformationen-hinterlegt | auftragskonfiguration |
