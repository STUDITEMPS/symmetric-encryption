## Einbuchen in Schichten freigeschaltet

## Bounded Kontext

Das Event "Einbuchen in Schichten freigeschaltet" wird von der Auftragskonfiguration produziert, sobald ein Customer Success Manager
einen Auftrag für das durch Studenten selbständige Einbuchen in Schichten freischaltet.

Das zugehörige jobvalley Produkt heißt ["Einbuchen in Schichten"](https://hilfe.temping.studitemps.de/article/1198-selbststandiges-einbuchen-in-schichten-durch-die-app).

## `schaltet_einbuchen_in_schichten_frei`

| Name         | Type | Pflichtfeld | Beschreibung                                                     |
| ------------ | ---- | ----------- | ---------------------------------------------------------------- |
| fuer_auftrag | URI  | Pflicht     | Auftrag, für den das Einbuchen in Schichten freigeschaltet wird. |

## Transport über RabbmitMQ

| Routing Key                                                 | Exchange              |
| ----------------------------------------------------------- | --------------------- |
| auftragskonfiguration.einbuchen-in-schichten-freigeschaltet | auftragskonfiguration |
