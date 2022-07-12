## Studienbescheinigung geloescht

## Bounded Kontext

Das Event "Studienbescheinigung-geloescht" wird produziert sobald ein Student eine bestehende Studienbescheinigung in der App geloescht hat. Verifizierte Dokumente können nicht mehr geloescht werden.

## Feldname

`loescht_studienbescheinigung`

## Felder von loescht_studienbescheinigung

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| student | URI | Pflicht  | Global eindeutige Identifikation des Studenten. |
| studienbescheinigung | URI | Pflicht  | Global eindeutige Identifikation der Studienbescheinigung. |
| studentenangaben | Object | Pflicht | Angaben des Studenten zur gelöschten Studienbescheinigung. |

### Details zu studentenangaben

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| gueltig_ab | Date | Pflicht  | Begin des Gültigkeitszeitraum des Dokuments |
| gueltig_bis | Date | Optional  | Ende des Gültigkeitszeitraum des Dokuments. Bei unbefristeten Dokumenten wird das Enddatum weggelassen. |
| dateien | Array[string] | Pflicht  | Referenzen auf die Dateien aus denen das geloschte Dokument besteht. |
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
| studentenverwaltung.studienbescheinigung-geloescht | studentenverwaltung  |
