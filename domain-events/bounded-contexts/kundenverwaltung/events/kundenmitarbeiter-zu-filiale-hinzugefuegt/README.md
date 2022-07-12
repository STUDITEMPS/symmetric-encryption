## Kundenmitarbeiter zu Filiale hinzugefuegt (Achtung: dieses Event wird Corporate intern verwendet und kann sich noch ändern)

## Bounded Kontext

Kontext Kundenverwaltung wirft dieses Event, wenn ein Kundenmitarbeiter zu einer Filiale hinzugefuegt wurde.
Zu einer Filiale koennen mehrere Kundenmitarbeiter hinzugefuegt werden.
Ebenso kann ein Kundenmitarbeiter zu mehreren Filialen hinzugefuegt werden.

## Feldname

`fuegt_kundenmitarbeiter_zu_filiale_hinzu`

## Felder von fuegt_kundenmitarbeiter_zu_filiale_hinzu

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| filiale | URI | Pflicht | Global eindeutige Identifikation der Filiale |
| kundenmitarbeiter | URI | Pflicht | Global eindeutige Identifikation des Kundenmitarbeiters|

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| kundenverwaltung.kundenmitarbeiter-zu-filiale-hinzugefuegt | kundenverwaltung|
