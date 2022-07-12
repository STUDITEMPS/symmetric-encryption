## Geschlecht angegeben

## Bounded Kontext

Das Event "Geschlecht angegeben" wird produziert sobald ein Student sein Geschlecht angibt oder ändert.

## Feldname

`gibt_geschlecht_an`

## Felder von gibt_geschlecht_an

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| fuer_student | URI | Pflicht  | Global eindeutige Identifikation des Studenten. |
| geschlecht_pruefsumme | SHA-1 message digest (hex) | Pflicht  | SHA-1 Prüfsumme des Geschlechts (Optionen: `Male` und `Female`) |

## Details zur Prüfsumme

Die Prüfsumme wird gebildet mit dem Algorithmus des Digest::SHA1 Moduls

```
geschlecht="Male"
Digest::SHA1.hexdigest "#{student_uri}_#{geschlecht}"
=> "221d26dc16fce1da1ff61c8f485e9cf82b10001d"
(student_uri wird mit in die hexdigest funktion gesteckt als salt)
```

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenverwaltung.geschlecht-angegeben | studentenverwaltung  |
