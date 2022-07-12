## Studienbescheinigung vorgelegt

## Bounded Kontext

Das Event "Studienbescheinigung-vorgelegt" wird produziert sobald ein Student eine Studienbescheinigung in der App hochgeladen hat.

## Feldname

`legt_studienbescheinigung_vor`

## Felder von legt_studienbescheinigung_vor

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| student | URI | Pflicht  | Global eindeutige Identifikation des Studenten. |
| studienbescheinigung | URI | Pflicht  | Global eindeutige Identifikation der Studienbescheinigung. |
| studentenangaben | Object | Pflicht | Angaben des Studenten zur vorgelegten Studienbescheinigung. |

### Details zu studentenangaben

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| gueltig_ab | Date | Pflicht  | Begin des Gültigkeitszeitraum des Dokuments |
| gueltig_bis | Date | Optional  | Ende des Gültigkeitszeitraum des Dokuments. Bei unbefristeten Dokumenten wird das Enddatum weggelassen. |
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
| studentenverwaltung.studienbescheinigung-vorgelegt | studentenverwaltung  |
