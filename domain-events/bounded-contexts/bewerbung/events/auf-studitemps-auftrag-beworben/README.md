## Auf Studitemps-Auftrag beworben

## Bounded Kontext

## Feldname

`reicht_studitemps_bewerbung_ein`

## Felder von reicht_studitemps_bewerbung_ein

| Name | Typ | Pflichtfeld | Beschreibung |
|---|---|---|---|
| student | URI | Pflicht | Die URI des Studenten |
| fuer_auftrag | URI | Pflicht | Der jobvalley Auftrag, für den eine Bewerbung eingereicht wird |

## Transport über RabbmitMQ

| Routing Key | Exchange |
|---|---|
| bewerbung.auf-studitemps-auftrag-beworben | jobmensa |
