## Freischaltung für Buchen von Einsatzzeiten zurückgezogen

## Bounded Kontext

Das Event "Freischaltung für Buchen von Einsatzzeiten zurückgezogen" wird von der Auftragskonfiguration produziert, sobald ein Customer Success Manager die vorherige Freischaltung eines Auftrags für die das Buchen von Einsatzzeiten zurückzieht.

Das zugehörige jobvalley Produkt heißt ["Studenten buchen ihre Einsatzzeit selbst"](TODO).

## `zieht_freischaltung_fuer_buchen_von_einsatzzeiten_zurueck`

| Name         | Type | Pflichtfeld | Beschreibung                                            |
| ------------ | ---- | ----------- | ------------------------------------------------------- |
| fuer_auftrag | URI  | Pflicht     | Auftrag, für den die Freischaltung zurückgeszogen wird. |

## Transport über RabbmitMQ

| Routing Key                                                                      | Exchange              |
| -------------------------------------------------------------------------------- | --------------------- |
| auftragskonfiguration.freischaltung-fuer-buchen-von-einsatzzeiten-zurueckgezogen | auftragskonfiguration |
