## Aktuelles Studium festgelegt

## Bounded Kontext

Das Event "Aktuelles Studium festgelegt" wird produziert sobald ein Student sein aktuelles Studium angibt.

## Feldname

`legt_aktuelles_studium_fest`

## Felder von legt_aktuelles_studium_fest

| Name | Typ | Pflichtfeld | Beschreibung |
|---|---|---|---|
| student | URI | Pflicht | Global eindeutige Identifikation des Studenten. |
| studiengang | String | Pflicht | Bezeichnung des aktuellen Studiengangs (Freitexteingabe des Studenten) |
| beginn | String | Pflicht | Angabe zum Beginn des Studiums (z.B. WS 2019) |
| studienbereiche | Array | Vom Studenten hinzugefügte Studienbereiche (Auswahl aus definierter Liste) |


## Transport über RabbmitMQ

| Routing Key | Exchange |
|---|---|
| studentenverwaltung.aktuelles-studium-festgelegt | studentenverwaltung |
