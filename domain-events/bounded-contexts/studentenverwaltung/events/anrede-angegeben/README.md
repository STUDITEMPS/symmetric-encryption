## Anrede angegeben

## Bounded Kontext

Das Event "Anrede angegeben" wird produziert sobald ein Student seine Anrede angibt oder ändert.

## Feldname

`gibt_anrede_an`

## Felder von gibt_anrede_an

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| student | URI | Pflicht  | Global eindeutige Identifikation des Studenten. |
| anrede-pruefsumme | SHA-1 message digest (hex) | Pflicht  | SHA-1 Prüfsumme der Anrede (Optionen: `Herr` und `Frau`) |

## Details zur Prüfsumme

Die Prüfsumme wird gebildet mit dem Algorithmus des Digest::SHA1 Moduls

```
anrede="Herr"
Digest::SHA1.hexdigest '#{student_uri}_#{anrede}'
=> "1db77fd65e0a7aa1389c5e4f6632739932d873c4"
(student_uri wird mit in die hexdigest funktion gesteckt als salt)
```

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenverwaltung.anrede-angegeben | studentenverwaltung  |
