## Arbeitszeit zu Auftrag zugeordnet

## Bounded Kontext

Die Auftragszuordnung produziert das Event sobald die Arbeitszeit zu einem Auftrag zugeordnet wurde.

## Feldname

`dokumentiert_arbeitszeit`

## Felder von dokumentiert_arbeitszeit

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| @id  | URI  | Pflicht  | Global eindeutige Identifikation der zugeordneten Arbeitszeit.|
| fand_im_auftrag_statt  | URI | Pflicht  | Global eindeutige Identifikation des Auftrags. |


## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| auftragszuordnung.arbeitszeit-zu-auftrag-zugeordnet | auftragszuordnung  |