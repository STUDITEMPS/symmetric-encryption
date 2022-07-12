## Studentenstatus angegeben

## Bounded Kontext

Das Event "Studentenstatus angegeben" wird produziert, sobald die/der Student*in eine Angabe zu seinem/ihrem aktuellen Status der Immatrikulation macht.

## Feldname

`gibt_studentenstatus_an`

## Felder von gibt_studentenstatus_an

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| student | URI | Pflicht  | Global eindeutige Identifikation des Studenten. |
| ist_student | Boolean | Pflicht  | Status des Studenten |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenstammdaten.studentenstatus-angegeben | studentenstammdaten  |
