## Auftrag für Student vorgeschlagen

## Bounded Kontext

Das Matching schlägt einen Auftrag für einen Studenten vor.

## Feldname

`schlaegt_vor`

## Felder von schlaegt_vor

| Name | Typ | Pflichtfeld | Beschreibung |
|---|---|---|---|
| fuer_student | URI | Pflicht | Die URI des Studenten, für den ein Vorschlag unterbreitet wird. |
| auftrag | URI | Pflicht | Der jobvalley Auftrag, der vorgeschlagen wird. |

## Transport über RabbmitMQ

| Routing Key | Exchange |
|---|---|
| matching.auftrag-fuer-student-vorgeschlagen | matching |
