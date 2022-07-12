## Name angegeben

## Bounded Kontext

Das Event "Name angegeben" wird produziert sobald ein Student seinen Namen angibt oder ändert.

## Feldname

`gibt_name_an`

## Felder von gibt_name_an

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| fuer_student | URI | Pflicht  | Global eindeutige Identifikation des Studenten. |
| vorname_pruefsumme | SHA-1 message digest (hex) | Pflicht  | SHA-1 Prüfsumme des Vornamens |
| nachname_pruefsumme | SHA-1 message digest (hex) | Pflicht  | SHA-1 Prüfsumme des Nachnamens |

## Details zur Prüfsumme

Die Prüfsumme wird gebildet mit dem Algorithmus des Digest::SHA1 Moduls

vorname="Paul"
nachname="Blabla"
vorname_pruefsumme = Digest::SHA1.hexdigest "#{student_uri}_#{vorname}"
=> "221d26dc16fce1da1ff61c8f485e9cf82b10001d"
nachname_pruefsumme = Digest::SHA1.hexdigest "#{student_uri}_#{nachname}"
=> "249d26dc16fce1da3ff61c8f485e9cf82b10001d"
(student_uri wird mit in die hexdigest funktion gesteckt als salt)

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenverwaltung.name-angegeben | studentenverwaltung  |
