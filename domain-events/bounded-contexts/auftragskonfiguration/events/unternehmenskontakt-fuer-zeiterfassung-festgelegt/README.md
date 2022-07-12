## Bounded Kontext

Die Auftragskonfiguration produziert das Event, sobald der Unternehmenskontakt für die Zeiterfassung für einen Auftrag festgelegt wird. Der Unternehmenskontakt kann jederzeit geändert werden.

## Felder des Events

| Name                                             | Typ    | Pflichtfeld | Beschreibung                    |
| ------------------------------------------------ | ------ | ----------- | ------------------------------- |
| legt_unternehmenskontakt_fuer_zeiterfassung_fest | Object | Pflicht     | Unternehmenskontakt und Auftrag |

## Felder von legt_unternehmenskontakt_fuer_zeiterfassung_fest

| Name                | Typ    | Pflichtfeld | Beschreibung                                              |
| ------------------- | ------ | ----------- | --------------------------------------------------------- |
| fuer_auftrag        | URI    | Pflicht     | Auftrag, für den der Unternehmenskontakt festgelegt wurde |
| unternehmenskontakt | Object | Pflicht     | der festgelegte Unternehmenskontakt                       |

## Felder von unternehmenskontakt

| Name     | Typ    | Pflichtfeld | Beschreibung                            |
| -------- | ------ | ----------- | --------------------------------------- |
| anrede   | String | Optional    | kann nur "Herr" oder "Frau" sein        |
| vorname  | String | Pflicht     | Vorname des Unternehmenskontakts        |
| nachname | String | Pflicht     | Nachname des Unternehmenskontakts       |
| email    | String | Pflicht     | E-Mail-Adresse des Unternehmenskontakts |

## Transport über RabbmitMQ

| Routing Key                                                             | Exchange              |
| ----------------------------------------------------------------------- | --------------------- |
| auftragskonfiguration.unternehmenskontakt-fuer-zeiterfassung-festgelegt | auftragskonfiguration |
