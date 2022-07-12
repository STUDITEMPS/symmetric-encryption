# Anzeige beendet

## Bounded Kontext

Die Anzeigenverwaltung produziert das Event sobald ein Staffing Mitarbeiter die Anzeige beendet.

## Feldname

`beendet-anzeige`

## Felder von `beendet-anzeige`

| Name | Typ | Pflichtfeld | Beschreibung |
|---|---|---|---|
| @id | URI | Pflicht | Die URI der Anzeige in der Anzeigenverwaltung |

## Transport über RabbmitMQ

| Routing Key | Exchange |
|---|---|
| anzeigenverwaltung.anzeige-beendet | anzeigenverwaltung |
