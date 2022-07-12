## Vorname geaendert

## Bounded Kontext

Kontext Kundenverwaltung wirft dieses Event, wenn ein Kundenmitarbeiter seinen Vornamen aendert.

## Feldname

`aendert_vorname`

## Felder von aendert_vorname

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| fuer_kundenmitarbeiter | URI | Pflicht  | Global eindeutige Identifikation des Kundenmitarbeiters. |
| vorname | String | Pflicht  | Vorname des Kundenmitarbeiters. |


## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| kundenverwaltung.vorname-geaendert | kundenverwaltung |
