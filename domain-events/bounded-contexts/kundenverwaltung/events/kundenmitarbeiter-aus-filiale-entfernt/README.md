## Kundenmitarbeiter aus Filiale entfernt (Achtung: dieses Event wird Corporate intern verwendet und kann sich noch ändern)

## Bounded Kontext

Kontext Kundenverwaltung wirft dieses Event, wenn ein Kundenmitarbeiter aus einer Filiale entfernt wurde.
Da ein Kundenmitarbeiter gleichzeitig für mehrere Filialen arbeiten kann, ist dies nicht gleichbedeutend damit, dass der Kundenmitarbeiter auch gelöscht wird.

## Feldname

`entfernt_kundenmitarbeiter_aus_filiale`

## Felder von entfernt_kundenmitarbeiter_aus_filiale

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| filiale | URI | Pflicht | Global eindeutige Identifikation der Filiale |
| kundenmitarbeiter | URI | Pflicht | Global eindeutige Identifikation des Kundenmitarbeiters|

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| kundenverwaltung.kundenmitarbeiter-aus-filiale-entfernt | kundenverwaltung |
