## Arbeitserlaubnis abgelehnt

## Bounded Kontext

Das Event "Arbeitserlaubnis abgelehnt" wird produziert, sobald ein jobvalley Mitarbeiter das Dokument ablehnt.

## Feldname

`lehnt_arbeitserlaubnis_ab`

## Felder von lehnt_arbeitserlaubnis_ab

| Name                  | Typ | Pflichtfeld | Beschreibung                                                 |
| --------------------- | --- | ----------- | ------------------------------------------------------------ |
| student               | URI | Pflicht     | Global eindeutige Identifikation des Studenten.              |
| arbeitserlaubnis      | URI | Pflicht     | Global eindeutige Identifikation des Dokuments.              |
| ablehngrund           | URI | Pflicht     | Grund der Ablehnung des Dokuments                            |

## Mögliche Ablehngründe

jeweils als `tech.studitemps:studentenverwaltung:studentendokument-abgelehnt-grund:[grund]`

-   `abweichende-gueltigkeit` (Der angegebene Gültigkeitszeitraum weicht von dem auf dem Dokument ab)
-   `unvollstaendig` (Teile des Dokument liegen nicht vor)
-   `inhaltlich-falsch` (Das Dokument ist keine Arbeitserlaubnis)
-   `unlesbar` (Das Dokument ist unlesbar)

## Transport über RabbmitMQ

| Routing Key                                        | Exchange            |
| -------------------------------------------------- | ------------------- |
| studentenverwaltung.arbeitserlaubnis-abgelehnt | studentenverwaltung |
