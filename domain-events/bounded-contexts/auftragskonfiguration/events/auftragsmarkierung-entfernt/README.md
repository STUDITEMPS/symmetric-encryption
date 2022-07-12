## Auftragsmarkierung entfernt

## Bounded Kontext

Das Event "Auftragsmarkierung entfernt" wird von der Auftragskonfiguration produziert, sobald ein CSM/A die Markierung eines Auftrags entfernt.

## `entfernt_auftragsmarkierung`

| Name    | Type | Pflichtfeld | Beschreibung                         |
| ------- | ---- | ----------- | ------------------------------------ |
| auftrag | URI  | Pflicht     | Auftrag, der nicht mehr markiert ist |

## Transport über RabbmitMQ

| Routing Key                                       | Exchange              |
| ------------------------------------------------- | --------------------- |
| auftragskonfiguration.auftragsmarkierung-entfernt | auftragskonfiguration |
