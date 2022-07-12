## Student für Auftrag vorgeschlagen

## Bounded Kontext

Das Matching schlägt einen Studenten für einen Auftrag vor. Dieses Event kann zum einen von einem CSM ausgelöst werden und zum anderen automatisiert durch ein System zustande kommen.

## Feldname

`schlaegt_vor`

## Felder von schlaegt_vor

| Name | Typ | Pflichtfeld | Beschreibung |
|---|---|---|---|
| student | URI | Pflicht | Die URI des Studenten, der vorgeschlagen wird. |
| fuer_auftrag | URI | Pflicht | Der jobvalley Auftrag, für den ein Vorschlag unterbreitet wird. |

## Transport über RabbmitMQ

| Routing Key | Exchange |
|---|---|
| matching.student-fuer-auftrag-vorgeschlagen | matching |
