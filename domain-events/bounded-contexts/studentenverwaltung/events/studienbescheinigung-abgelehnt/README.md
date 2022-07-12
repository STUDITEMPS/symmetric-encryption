## Studienbescheinigung abgelehnt

## Bounded Kontext

Das Event "Studienbescheinigung abgelehnt" wird produziert, sobald ein jobvalley Mitarbeiter das Dokument ablehnt.

## Feldname

`lehnt_studienbescheinigung_ab`

## Felder von lehnt_studienbescheinigung_ab

| Name                  | Typ | Pflichtfeld | Beschreibung                                                 |
| --------------------- | --- | ----------- | ------------------------------------------------------------ |
| student               | URI | Pflicht     | Global eindeutige Identifikation des Studenten.              |
| studienbescheinigung  | URI | Pflicht     | Global eindeutige Identifikation der Studienbescheinigung.   |
| ablehngrund           | URI | Pflicht     | Grund der Ablehnung der Studienbescheinigung                 |

## Mögliche Ablehngründe

jeweils als `tech.studitemps:studentenverwaltung:studentendokument-abgelehnt-grund:[grund]`

-   `abweichende-gueltigkeit` (Der angegebene Gültigkeitszeitraum weicht von dem auf der Studienbescheinigung ab)
-   `unvollstaendig` (Teile der Studienbescheinigung liegen nicht vor)
-   `inhaltlich-falsch` (Das ist keine Studienbescheinigung)
-   `unlesbar` (Die Studienbescheinigung ist unlesbar)

## Transport über RabbmitMQ

| Routing Key                                        | Exchange            |
| -------------------------------------------------- | ------------------- |
| studentenverwaltung.studienbescheinigung-abgelehnt | studentenverwaltung |
