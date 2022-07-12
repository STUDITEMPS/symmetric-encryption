## Kundenmitarbeiterberechtigungen festgelegt

## Bounded Kontext

Kontext KundenportalAuth wirft dieses Event, nachdem die Berechtigungen eines Kundenmitarbeiters festgelegt wurden.

## Feldname

`lege_kundenmitarbeiterberechtigungen_fest`

## Felder von lege_kundenmitarbeiterberechtigungen_fest

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| fuer_kundenmitarbeiter | URI | Pflicht  | Global eindeutige Identifikation des Kundenmitarbeiters. |
| berechtigungen | Liste | Pflicht  | Liste mit Berechtigungen des Kundenmitarbeiters. |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| kundenportal_auth.kundenmitarbeiterberechtigungen-festgelegt | kundenportal_auth |
