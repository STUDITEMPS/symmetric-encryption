## Freischaltung für Einbuchen in Schichten zurückgezogen

## Bounded Kontext

Das Event "Freischaltung für Einbuchen in Schichten zurückgezogen" wird von der Auftragskonfiguration produziert, sobald
ein Customer Success Manager die vorherige Freischaltung eines Auftrags für das selbständige Einbuchen in Schichten zurückzieht.
Das zugehörige jobvalley Produkt heißt "Einbuchen in Schichten"

## `zieht_freischaltung_fuer_einbuchen_in_schichten_zurueck`

| Name         | Type | Pflichtfeld | Beschreibung                                                                          |
| ------------ | ---- | ----------- | ------------------------------------------------------------------------------------- |
| fuer_auftrag | URI  | Pflicht     | Auftrag, für den die Freischaltung des selbstständigen Einbuchens zurückgezogen wird. |

## Transport über RabbmitMQ

| Routing Key                                                                    | Exchange              |
| ------------------------------------------------------------------------------ | --------------------- |
| auftragskonfiguration.freischaltung-fuer-einbuchen-in-schichten-zurueckgezogen | auftragskonfiguration |
