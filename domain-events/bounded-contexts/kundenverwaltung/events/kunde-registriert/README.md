## Kunde registriert (Achtung: dieses Event wird Corporate intern verwendet und kann sich noch ändern)

## Bounded Kontext

Kontext Kundenverwaltung wirft dieses Event, wenn ein Kunde registriert wurde.

Für Bestellungen im Self-Service-Prozess muss sich der Kunde erstmals selbstständig registrieren.
Hierbei werden Stammdaten des Kunden erfasst sowie der Kundenmitarbeiter, der die Registrierung durchführt.
Die Firmierung des Kunden sollte der Bezeichnung im Handelsregistereintrag entsprechen, da er für Verträge und andere rechtliche Dokumente verwendet wird.
Sofern der Kunde im Handelsregister eingetragen ist, müssen das zuständige Amtsgericht sowie die Handelsregisternummer eingetragen werden. DIes wird derzeit erst nachträglich geprüft, wenn der Kunde seinen ersten Vertrag mit uns zeichnet. Eine direkte Validierung ist in einer späteren Iteration geplant.

## Feldname

`registriert_kunde`

## Felder von registriert_kunde

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| @id| URI | Pflicht | Global eindeutige Identifikation des Kunden|
| firmierung| String | Pflicht | Firmierung des Kunden wie im Handelsregister oder anderem Verzeichnis. |
| vertragsadresse| Object | Pflicht | Vertragsadresse des Kunden |
| handelsregisternummer| String | Optional | Handelsregisternummer des Kunden. |
| amtsgericht| String | Optional | Amtsgericht des Kunden. |
| kundenmitarbeiter | Object | Pflicht | Kundenmitarbeiter, der den Kunden registriert |


## Felder von vertragsadresse

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| plz | String | Pflicht  | PLZ |
| stadt | String | Pflicht  | Ort |
| strasse | String | Pflicht  | Strasse |
| hausnummer | String | Optional | Hausnummer |

## Felder von kundenmitarbeiter

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| @id| URI | Pflicht | Global eindeutige Identifikation des Kundenmitarbeiters|
| anrede| String | Pflicht | Anrede |
| vorname| String | Pflicht | Vorname |
| nachname| String | Pflicht | Nachname|
| email| String | Pflicht | E-Mail-Adresse|

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| kundenverwaltung.kunde-registriert | kundenverwaltung|
