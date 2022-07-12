## Immatrikuliert angegeben

## Bounded Kontext

Das Event "Immatrikuliert angegeben" wird produziert, sobald ein Student eine Angabe zu seinem aktuellen Studium macht und nicht bereits den Status "Immatrikuliert" hatte.

## Feldname

`gibt_immatrikuliert_an`

## Felder von gibt_immatrikuliert_an

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| fuer_student | URI | Pflicht  | Global eindeutige Identifikation des Studenten. |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenverwaltung.immatrikuliert-angegeben | studentenverwaltung  |
