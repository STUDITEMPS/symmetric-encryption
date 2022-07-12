## Unternehmensname hinterlegt

## Bounded Kontext

Die Auftragskonfiguration produziert das Event, sobald der Name des Unternehmens neu hinterlegt wurde.

Der Name kann hier grob abweichen von dem, der als `firmenname_legal` in der rechtlichen Unternehmenszuordnung festgelegt wurde.

## Felder von `hinterlegt_unternehmensnamen`

| Name         | Type   | Pflichtfeld | Beschreibung                                       |
| ------------ | ------ | ----------- | -------------------------------------------------- |
| fuer_auftrag | URI    | Pflicht     | Auftrag, dessen Unternehmensname hinterlegt wurde. |
| name         | String | Pflicht     | Name des Unternehmens.                             |

## Transport über RabbmitMQ

| Routing Key                                       | Exchange              |
| ------------------------------------------------- | --------------------- |
| auftragskonfiguration.unternehmensname-hinterlegt | auftragskonfiguration |
