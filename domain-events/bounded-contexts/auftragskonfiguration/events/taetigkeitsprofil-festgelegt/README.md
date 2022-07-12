# Tätigkeitsprofil festgelegt

## Bounded Kontext

Auftragskonfiguration produziert das Event `Tätigkeitsprofil festgelegt`, wenn für einen Auftrag das Tätigkeitsprofil hinterlegt oder angepasst wird.

Aktuell kann das Tätigkeitsprofil eines Auftrages angepasst werden, solange es keine Schichten gibt.

## Feldname

`legt_taetigkeitsprofil_fest`

## Felder von `legt_taetigkeitsprofil_fest`

| Name              | Typ    | Pflichtfeld | Beschreibung                                       |
| ----------------- | ------ | ----------- | -------------------------------------------------- |
| fuer_auftrag      | URI    | Pflicht     | Auftrag, dessen Tätigkeitsprofil festgelegt wurde. |
| taetigkeitsprofil | Object | Pflicht     | Neues Tätigkeitsprofil.                            |

## Felder von `taetigkeitsprofil`

| Name | Typ    | Pflichtfeld | Beschreibung                                                         |
| ---- | ------ | ----------- | -------------------------------------------------------------------- |
| @id  | URI    | Pflicht     | [URI des Tätigkeitsprofils](https://airtable.com/shrDjwNBTnicwIwif). |
| name | String | Pflicht     | Name des Tätigkeitsprofils.                                          |

## Transport über RabbmitMQ

| Routing Key                                        | Exchange              |
| -------------------------------------------------- | --------------------- |
| auftragskonfiguration.taetigkeitsprofil-festgelegt | auftragskonfiguration |
