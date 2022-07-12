## Nachname geaendert

## Bounded Kontext

Kontext Kundenverwaltung wirft dieses Event, wenn ein Kundenmitarbeiter seinen Nachnamen aendert.

## Feldname

`aendert_nachname`

## Felder von aendert_nachname

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| fuer_kundenmitarbeiter | URI | Pflicht  | Global eindeutige Identifikation des Kundenmitarbeiters. |
| Nachname | String | Pflicht  | Nachname des Kundenmitarbeiters. |


## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| kundenverwaltung.nachname-geaendert | kundenverwaltung |
