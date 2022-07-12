## Nicht-Immatrikuliert angegeben

## Bounded Kontext

Das Event "Nicht-Immatrikuliert angegeben" wird produziert, sobald ein Nutzer bei der Frage nach seinem aktuellen Studium die "kein Student"-Option wählt.

## Feldname

`gibt_nicht_immatrikuliert_an`

## Felder von gibt_nicht_immatrikuliert_an

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| fuer_student| URI | Pflicht  | Global eindeutige Identifikation des Nutzers. |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenverwaltung.nicht-immatrikuliert-angegeben | studentenverwaltung  |
