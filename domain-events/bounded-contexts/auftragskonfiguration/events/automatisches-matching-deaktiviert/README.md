## Automatisches Matching deaktiviert

## Bounded Kontext

Das Event "Automatisches Matching deaktiviert" wird von der Auftragskonfiguration produziert, sobald ein Auftrag so konfiguriert wird, dass er manuelle, auftragsbezogene Qualifizierungsschritte benötigt und die Zuordnung von Student:innen und Aufträgen von den CSMs vorgenommen wird.

Aktuell werden neue Staffing-Aufträge mit deaktiviertem automatischen Matching erstellt, ohne dass hierfür dieses Event geworfen wird.

Das zugehörige jobvalley Produkt heißt "Automatisches Matching", deshalb nennen wir das auch hier so.

## `deaktiviert_automatisches_matching`

| Name         | Type | Pflichtfeld | Beschreibung                                                     |
| ------------ | ---- | ----------- | ---------------------------------------------------------------- |
| fuer_auftrag | URI  | Pflicht     | Auftrag, für den das Automatische Matching deaktiviert wird. |

## Transport über RabbmitMQ

| Routing Key                                                 | Exchange              |
| ----------------------------------------------------------- | --------------------- |
| auftragskonfiguration.automatisches-matching-deaktiviert | auftragskonfiguration |
