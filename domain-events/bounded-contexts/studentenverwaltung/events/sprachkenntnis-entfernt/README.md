## Sprachkenntnis entfernt

## Bounded Kontext

Das Event "Sprachkenntnis entfernt" wird produziert sobald ein Student (eines) seine(r) Sprachkenntnisse löscht. Dabei wird für multiple Änderungen für jeweils eine Sprache ein eigenes Domain Event produziert.

## Feldname

`entfernt_sprachkenntnis`

## Felder von entfernt_sprachkenntnis

| Name | Typ | Pflichtfeld | Beschreibung |
|---|---|---|---|
| fuer_student | URI | Pflicht | Global eindeutige Identifikation des Studenten. |
| sprache | URI | Pflicht | URI (ISO639-1) der Sprache, die entfernt wird. |

## Transport über RabbmitMQ

| Routing Key | Exchange |
|---|---|
| studentenverwaltung.sprachkenntnis-entfernt | studentenverwaltung |
