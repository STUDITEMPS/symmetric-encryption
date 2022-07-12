## Angaben von Arbeitserlaubnis bestätigt

## Bounded Kontext

Das Event "Angaben von Arbeitserlaubnis bestätigt" wird produziert, sobald ein jobvalley Mitarbeiter die Angaben zur Arbeitserlaubnis eines Studenten in Verify bestätigt.

## Feldname

`bestaetigt_angaben_von_arbeitserlaubnis`

## Felder von bestaetigt_angaben_von_arbeitserlaubnis

| Name                  | Typ    | Pflichtfeld | Beschreibung                                                 |
| --------------------- | ------ | ----------- | ------------------------------------------------------------ |
| student               | URI    | Pflicht     | Global eindeutige Identifikation des Studenten.              |
| arbeitserlaubnis      | URI    | Pflicht     | Global eindeutige Identifikation des Dokuments.              |
| studentenangaben      | Object | Pflicht     | Angaben des Studenten zum vorgelegten Dokument               |

### Details zu studentenangaben

| Name        | Typ           | Pflichtfeld | Beschreibung                                                                                            |
| ----------- | ------------- | ----------- | ------------------------------------------------------------------------------------------------------- |
| gueltig_ab  | Date          | Pflicht     | Begin des Gültigkeitszeitraum des Dokuments                                                             |
| gueltig_bis | Date          | Optional    | Ende des Gültigkeitszeitraum des Dokuments. Bei unbefristeten Dokumenten wird das Enddatum weggelassen. |
| dateien     | Array[string] | Pflicht     | Referenzen auf die Dateien aus denen das vorgelegte Dokument besteht.                                   |
| staat       | string        | Pflichtfeld | Staat, aus dem der Student kommt                                                                        |

## Transport über RabbmitMQ

| Routing Key                                                 | Exchange            |
| ----------------------------------------------------------- | ------------------- |
| studentenverwaltung.angaben-von-arbeitserlaubnis-bestaetigt | studentenverwaltung |
