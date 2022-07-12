## Bounded Kontext

Der Kontext Assessment produziert das Event, sobald ein Recruiter die Sprachkenntnis eine:r:s Student:in in einer Sprache (aktuell nur Deutsch oder Englisch möglich) bewertet.

## Felder von bewertet_sprachkenntnis

| Name           | Typ    | Pflichtfeld | Beschreibung                                             |
| -------------- | ------ | ----------- | -------------------------------------------------------- |
| student        | URI    | Pflicht     | Global eindeutige Identifikation de:r:s Student:en:in    |
| sprachkenntnis | Object | Pflicht     | Eine Sprache inklusive Sprechniveau de:r:s Student:en:in |

## Felder sprachkenntnis

| Name    | Typ | Pflichtfeld | Beschreibung                |
| ------- | --- | ----------- | --------------------------- |
| sprache | URI | Pflicht     | URI (ISO639-1) der Sprache. |
| niveau  | URI | Pflicht     | URI des Niveaus.            |

### `niveau`

Folgende Niveaus sind definiert:

-   `tech.studitemps:sprachen:niveau:gar-nicht`
-   `tech.studitemps:sprachen:niveau:anfaenger`
-   `tech.studitemps:sprachen:niveau:fortgeschritten`
-   `tech.studitemps:sprachen:niveau:fliessend`
-   `tech.studitemps:sprachen:niveau:muttersprache`

## Transport über RabbmitMQ

| Routing Key                         | Exchange   |
| ----------------------------------- | ---------- |
| assessment.sprachkenntniss-bewertet | assessment |
