## Automatisches Matching aktiviert

## Bounded Kontext

Das Event "Automatisches Matching aktiviert" wird von der Auftragskonfiguration produziert, sobald ein Auftrag so konfiguriert wird, dass er keine manuellen, auftragsbezogenen Qualifizierungsschritte benötigt und die Zuordnung von Student:innen und Aufträgen automatisiert über den Abgleich von Matchingkriterien erfolgt.

Das Aktivieren kann durch jobvalley Mitarbeiter:innen passieren oder dadurch, dass ein Standard-Auftrag in der Personalbestellung angelegt wird.

Das zugehörige jobvalley Produkt heißt "Automatisches Matching", deshalb nennen wir das auch hier so.

## `aktiviert_automatisches_matching`

| Name         | Type | Pflichtfeld | Beschreibung                                                     |
| ------------ | ---- | ----------- | ---------------------------------------------------------------- |
| fuer_auftrag | URI  | Pflicht     | Auftrag, für den das Automatische Matching aktiviert wird. |

## Transport über RabbmitMQ

| Routing Key                                                 | Exchange              |
| ----------------------------------------------------------- | --------------------- |
| auftragskonfiguration.automatisches-matching-aktiviert | auftragskonfiguration |
