## Buchen von Einsatzzeiten freigeschaltet

## Bounded Kontext

Das Event "Buchen von Einsatzzeiten freigeschaltet" wird von der Auftragskonfiguration produziert, sobald ein Customer Success Manager dafür freischaltet, dass Studenten ihre Einsatzzeiten selbst buchen können.

Das zugehörige jobvalley Produkt heißt ["Studenten buchen ihre Einsatzzeiten selbst"].
Wir ermöglichen damit die Absprache von Einsatzzeiten zwischen Unternehmen und Studenten, ohne dass ein Customer Success Manager über diese Absprache informiert werden muss, damit er die Schichtanlage und Einstellung in Staffing vornehmen muss.

## `schaltet_buchen_von_einsatzzeiten_frei`

| Name         | Type | Pflichtfeld | Beschreibung                                                       |
| ------------ | ---- | ----------- | ------------------------------------------------------------------ |
| fuer_auftrag | URI  | Pflicht     | Auftrag, für den das Buchen von Einsatzzeiten freigeschaltet wird. |

## Transport über RabbmitMQ

| Routing Key                                                   | Exchange              |
| ------------------------------------------------------------- | --------------------- |
| auftragskonfiguration.buchen-von-einsatzzeiten-freigeschaltet | auftragskonfiguration |
