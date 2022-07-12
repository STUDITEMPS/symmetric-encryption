## Arbeitserlaubnis korrigiert

## Bounded Kontext

Das Event "Arbeitserlaubnis-korrigiert" wird produziert sobald ein Student eine Arbeitserlaubnis in der App geändert hat. Verifizierte Dokumente können in der App nicht mehr korrigiert werden.

## Feldname

`korrigiert_arbeitserlaubnis`

## Felder von korrigiert_arbeitserlaubnir

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| student | URI | Pflicht  | Global eindeutige Identifikation des Studenten. |
| arbeitserlaubnis | URI | Pflicht  | Global eindeutige Identifikation der Arbeitserlaubnis. |
| studentenangaben | Object | Pflicht | Angaben des Studenten zur korrigierten Arbeitserlaubnis |

### Details zu studentenangaben

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| gueltig_ab | Date | Pflicht  | Begin des Gültigkeitszeitraum des Dokuments |
| gueltig_bis | Date | Optional  | Ende des Gültigkeitszeitraum des Dokuments. Bei unbefristeten Dokumenten wird das Enddatum weggelassen. |
| dateien | Array[string] | Pflicht  | Referenzen auf die Dateien aus denen das korrigierte Dokument besteht. |
| staat | string  | Pflichtfeld  | Staat, aus dem der Student kommt |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenverwaltung.arbeitserlaubnis-korrigiert | studentenverwaltung  |
