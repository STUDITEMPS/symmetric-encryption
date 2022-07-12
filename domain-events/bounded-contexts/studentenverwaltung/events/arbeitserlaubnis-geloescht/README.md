## Arbeitserlaubnis geloescht

## Bounded Kontext

Das Event "Arbeitserlaubnis-geloescht" wird produziert sobald ein Student eine Arbeitserlaubnis in der App geloescht hat.

## Feldname

`loescht_arbeitserlaubnis`

## Felder von loescht_arbeitserlaubnis

| Name             | Typ    | Pflichtfeld | Beschreibung                                    |
| ---------------- | ------ | ----------- | ----------------------------------------------- |
| student          | URI    | Pflicht     | Global eindeutige Identifikation des Studenten. |
| arbeitserlaubnis | URI    | Pflicht     | Global eindeutige Identifikation der Arbeitserlaubnis. |
| studentenangaben | Object | Pflicht     | Angaben des Studenten zur gelöschten Arbeitserlaubnis. |


### Details zu studentenangaben

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| gueltig_ab | Date | Pflicht  | Begin des Gültigkeitszeitrau der Arbeitserlaubnis |
| gueltig_bis | Date | Optional  | Ende des Gültigkeitszeitraums der Arbeitserlaubnis. Bei einer unbefristeten Arbeitserlaubnis wird das Enddatum weggelassen. |
| dateien | Array[string] | Pflicht  | Referenzen auf die Dateien aus denen die gelöschte Arbeitserlaubnis besteht. |
| staat | string  | Pflichtfeld  | Staat, aus dem der Student kommt |

## Transport über RabbmitMQ

| Routing Key                                    | Exchange            |
| ---------------------------------------------- | ------------------- |
| studentenverwaltung.arbeitserlaubnis-geloescht | studentenverwaltung |
