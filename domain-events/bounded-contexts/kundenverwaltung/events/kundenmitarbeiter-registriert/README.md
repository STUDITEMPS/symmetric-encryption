## Kundenmitarbeiter registriert (Achtung: dieses Event wird Corporate intern verwendet und kann sich noch ändern)

## Bounded Kontext

Kontext Kundenverwaltung wirft dieses Event, wenn ein Kundenmitarbeiter registriert wurde.
Bei der Registrierung des Kundenmitarbeiters dient die E-Mail-Adresse als prozessübergreifender Schlüssel, um den Kundenmitarbeiter zu identifizieren.
Die Registrierung erfolgt derzeit in der Einsatzplanung.
Fügt man hier einem Kunden einen Kundenmitarbeiter hinzu, dessen E-Mail-Adresse noch nicht bekannt ist, wird der Kundenmitarbeiter mit der entsprechenden E-Mail-Adresse registriert.

## Feldname

`registriert_kundenmitarbeiter`

## Felder von registriert_kundenmitarbeiter

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| @id| URI | Pflicht | Global eindeutige Identifikation des Kundenmitarbeiters|
| anrede| String | Optional | Anrede (nur deshalb optional, da in bestehenden Daten nicht immer vorhanden)|
| vorname| String | Optional | Vorname (nur deshalb optional, da in bestehenden Daten nicht immer vorhanden)|
| nachname| String | Pflicht | Nachname|
| email| String | Pflicht | E-Mail-Adresse|

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| kundenverwaltung.kundenmitarbeiter-registriert| kundenverwaltung|
