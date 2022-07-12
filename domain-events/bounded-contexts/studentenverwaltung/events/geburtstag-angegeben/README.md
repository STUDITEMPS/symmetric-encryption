## Geburtstag angegeben

## Bounded Kontext

Das Event "Geburtstag angegeben" wird produziert sobald ein Student seinen Geburtstag angibt oder ändert.

## Feldname

`gibt_geburtstag_an`

## Felder von gibt_geburtstag_an

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| fuer_student | URI | Pflicht  | Global eindeutige Identifikation des Studenten. |
| geburtstag-pruefsumme | SHA-1 message digest (hex) | Pflicht  | SHA-1 Prüfsumme des Geburtstags |

## Details zur Prüfsumme

Die Prüfsumme wird gebildet mit dem Algorithmus des Digest::SHA1 Moduls und dem Geburtstag im iso8601 Format.

Digest::SHA1.hexdigest "#{student_uri}_#{Date.new(1985, 12, 24).iso8601}"
=> "85d5434805f861a5928924eb7fa37fa34d6a8af9"
Digest::SHA1.hexdigest "#{student_uri}_1985-12-24"
=> "85d5434805f861a5928924eb7fa37fa34d6a8af9"

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenverwaltung.geburtstag-angegeben | studentenverwaltung  |
