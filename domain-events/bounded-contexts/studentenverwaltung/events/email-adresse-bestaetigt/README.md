## E-Mail Adresse bestätigt

## Bounded Kontext

Das Event "E-Mail-Adresse bestätigt" wird produziert sobald ein Student seine (neue) E-Mail-Adresse bestätigt.

## Feldname

`bestaetigt_email_adresse`

## Felder von bestaetigt_email_adresse

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| fuer_student | URI | Pflicht  | Global eindeutige Identifikation des Studenten. |
| email_pruefsumme | SHA-1 message digest (hex) | Pflicht  | SHA-1 Prüfsumme der E-Mail-Adress |

## Details zur Prüfsumme

Die Prüfsumme wird gebildet mit dem algorithmus des Digest::SHA1 Moduls

Digest::SHA1.hexdigest 'email@adresse.de'
=> "1137e57c479f7698adbe180327a9c6e01e9f7969"

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenverwaltung.email-adresse-bestaetigt | studentenverwaltung  |
