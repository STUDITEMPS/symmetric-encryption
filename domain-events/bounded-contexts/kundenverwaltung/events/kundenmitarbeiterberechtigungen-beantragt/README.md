## Kundenmitarbeiterberechtigungen beantragt

## Bounded Kontext

Kontext Kundenverwaltung wirft dieses Event, wenn ein Kundenmitarbeiter seine Berechtigungen festlegen möchte.

## Feldname

`beantragt_kundenmitarbeiterberechtigungen`

## Felder von beantragt_kundenmitarbeiterberechtigungen

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| fuer_kundenmitarbeiter | URI | Pflicht  | Global eindeutige Identifikation des Kundenmitarbeiters. |
| berechtigungen | Liste | Pflicht  | Liste mit Berechtigungen des Kundenmitarbeiters. |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| kundenverwaltung.kundenmitarbeiterberechtigungen-beantragt | kundenverwaltung |
