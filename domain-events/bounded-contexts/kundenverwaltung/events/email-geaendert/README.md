## Email geaendert

## Bounded Kontext

Kontext Kundenverwaltung wirft dieses Event, wenn ein Kundenmitarbeiter seine E-Mail-Adresse aendert.

## Feldname

`aendert_email`

## Felder von aendert_email

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| fuer_kundenmitarbeiter | URI | Pflicht  | Global eindeutige Identifikation des Kundenmitarbeiters. |
| email | String | Pflicht  | E-Mail-Adresse |


## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| kundenverwaltung.email-geaendert | kundenverwaltung |
