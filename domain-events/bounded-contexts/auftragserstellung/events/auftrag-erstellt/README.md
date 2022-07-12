## Bounded Kontext

Die Auftragserstellung produziert das Event, sobald ein Auftrag erstellt wird.

## Felder des Events

| Name                            | Typ    | Pflichtfeld | Beschreibung                        |
| ------------------------------- | ------ | ----------- | ----------------------------------- |
| dokumentiert_auftragserstellung | Object | Pflicht     | Der im Event mitgelieferte Auftrag. |

## Felder von dokumentiert_auftragserstellung

| Name | Typ | Pflichtfeld | Beschreibung                                   |
| ---- | --- | ----------- | ---------------------------------------------- |
| @id  | URI | Pflicht     | Global eindeutige Identifikation des Auftrags. |

## Transport über RabbmitMQ

| Routing Key                         | Exchange           |
| ----------------------------------- | ------------------ |
| auftragserstellung.auftrag-erstellt | auftragserstellung |
