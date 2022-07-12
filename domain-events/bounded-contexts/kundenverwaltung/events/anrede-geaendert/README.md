## Anrede geaendert

## Bounded Kontext

Kontext Kundenverwaltung wirft dieses Event, wenn die Anrede eines Kundenmitarbeiter geandert wurde.

## Feldname

`aendert_anrede`

## Felder von aendert_anrede

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| fuer_kundenmitarbeiter | URI | Pflicht  | Global eindeutige Identifikation des Kundenmitarbeiters. |
| anrede | String | Pflicht  | Bezeichnung der Anrede (Optionen: `Herr` , `Frau` und `keine`) |


## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| kundenverwaltung.anrede-geaendert | kundenverwaltung |
