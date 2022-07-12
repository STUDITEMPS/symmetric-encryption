## Angaben von Studienbescheinigung bestätigt

## Bounded Kontext

Das Event "Angaben von Studienbescheinigung bestätigt" wird produziert, sobald ein jobvalley Mitarbeiter die Angaben zur Studienbescheinigung eines Studenten in Verify bestätigt.

## Feldname

`bestaetigt_angaben_von_studienbescheinigung`

## Felder von bestaetigt_angaben_von_studienbescheinigung

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| student | URI | Pflicht  | Global eindeutige Identifikation des Studenten. |
| studienbescheinigung | URI | Pflicht  | Global eindeutige Identifikation des Dokuments. |
| studentenangaben | Object | Pflicht | Angaben des Studenten zum vorgelegten Dokument |

### Details zu studentenangaben

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| gueltig_ab | Date | Pflicht  | Begin des Gültigkeitszeitraum des Dokuments |
| gueltig_bis | Date | Pflicht  | Ende des Gültigkeitszeitraum des Dokuments. Bei unbefristeten Dokumenten wird das Enddatum weggelassen. |
| dateien | Array[string] | Pflicht  | Referenzen auf die Dateien aus denen das vorgelegte Dokument besteht. |
| universitaet | Object  | Pflichtfeld  | Die Universität |
| studienfaecher | Array[Object]  | Pflichtfeld  | Studienfach und Fachsemester |
| studienart | string  | Pflichtfeld  | `tech.studitemps:beschaeftigungsart:vollzeit` oder `tech.studitemps:beschaeftigungsart:teilzeit` |
| besonderheiten | Array[string]  | Pflichtfeld  | URI Repräsentation der Besonderheiten. Mögliche Ausprägungen: <ul><li>`tech.studitemps:studienbesonderheit:promotion`</li><li>`tech.studitemps:studienbesonderheit:urlaubssemester`</li><li>`tech.studitemps:studienbesonderheit:vorbereitungssemester`</li></ul> |

### Details zu Universität
| Name | Typ  | Pflichtfeld  |  Beschreibung  |
|---|---|---|---|
| name | String | Pflicht | Der Name der Universität |
| staatlich_anerkannt | Boolean | Pflicht | Von jobvalley als staatlich anerkannte Universität geführt. |

### Details zu Studienfaecher
| Name | Typ  | Pflichtfeld  |  Beschreibung  |
|---|---|---|---|
| fachsemester | Integer | Pflicht | Das Fachsemester |
| studienfach | String | Pflicht | Das Studienfach |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenverwaltung.angaben-von-studienbescheinigung-bestaetigt | studentenverwaltung  |
