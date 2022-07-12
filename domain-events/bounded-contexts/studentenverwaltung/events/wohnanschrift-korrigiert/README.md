## Wohnanschrift korrigiert

## Bounded Kontext

Das Event "Wohnanschrift korrigiert" wird produziert, sobald ein Student in der Jobmensa seine Wohnanschrift ändert und als Grund für die Änderung eine Korrektur (z.B. Tippfehler oder allgemeine Änderung) angegeben hat.

## Feldname

`korrigiert_wohnanschrift`

## Felder von korrigiert_wohnanschrift

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| fuer_student | URI | Pflicht  | Global eindeutige Identifikation des Studenten. |
| wohnanschrift | Hash | Pflicht  | Die neu angegebene Adresse des Studenten. |

## Felder von wohnanschrift

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| plz | String | Pflicht  | Postleitzahl |
| stadt | String | Pflicht  | Stadtname |
| strasse | String | Pflicht  | Straßenname |
| hausnummer | String | Pflicht  | Hausnummer |
| adresszusatz | String | Optional | Adresszusatz |
| bundesland | String | Optional  | Bundesland |
| land | String | Optional  | Land |
| latitude | Float | Optional  | Geographische Breite der Anschrift |
| longitude | Float | Optional  | Geographische Länge der Anschrift |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenverwaltung.wohnanschrift-korrigiert | studentenverwaltung  |
