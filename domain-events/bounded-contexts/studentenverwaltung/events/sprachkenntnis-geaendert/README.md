## Sprachkenntnis geaendert

## Bounded Kontext

Das Event "Sprachkenntnis geaendert" wird produziert sobald ein Student seine Sprachkenntnisse angibt oder ändert. Dabei wird für multiple Änderungen für jeweils eine Sprach ein eigenes Domain Event produziert.

## Feldname

`aendert_sprachkenntnis`

## Felder von aendert_sprachkenntnis

| Name | Typ | Pflichtfeld | Beschreibung |
|---|---|---|---|
| fuer_student | URI | Pflicht | Global eindeutige Identifikation des Studenten. |
| sprache | URI | Pflicht | URI (ISO639-1) der Sprache. |
| niveau  | URI | Pflicht | URI des Niveaus. |

### `niveau`

Folgende Niveaus sind definiert:

-   `tech.studitemps:sprachen:niveau:gar-nicht`
-   `tech.studitemps:sprachen:niveau:anfaenger`
-   `tech.studitemps:sprachen:niveau:fortgeschritten`
-   `tech.studitemps:sprachen:niveau:fliessend`
-   `tech.studitemps:sprachen:niveau:muttersprache`


## Transport über RabbmitMQ

| Routing Key | Exchange |
|---|---|
| studentenverwaltung.sprachkenntnis-geaendert | studentenverwaltung |
