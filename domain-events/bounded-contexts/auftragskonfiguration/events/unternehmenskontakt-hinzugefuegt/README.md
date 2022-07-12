## Bounded Kontext

Die Auftragskonfiguration produziert das Event, sobald ein neuer Unternehmenskontakt im Auftrag hinzugefügt wurde. Man kann diesen Kontakt entfernen, dafür gibt es kein Event. Wenn man den gleichen Kontakt erneut hinzufügt, wird das Event "noch mal" geworfen.

## Felder von fuegt_unternehmenskontakt_hinzu

| Name         | Typ    | Pflichtfeld | Beschreibung                                              |
| ------------ | ------ | ----------- | --------------------------------------------------------- |
| fuer_auftrag | URI    | Pflicht     | Auftrag, für den der Unternehmenskontakt festgelegt wurde |
| anrede       | String | Optional    | kann nur "Herr" oder "Frau" sein wenn vorhanden           |
| vorname      | String | Pflicht     | Vorname des Unternehmenskontakts                          |
| nachname     | String | Pflicht     | Nachname des Unternehmenskontakts                         |
| email        | String | Pflicht     | E-Mail-Adresse des Unternehmenskontakts                   |

## Transport über RabbmitMQ

| Routing Key                                            | Exchange              |
| ------------------------------------------------------ | --------------------- |
| auftragskonfiguration.unternehmenskontakt-hinzugefuegt | auftragskonfiguration |
