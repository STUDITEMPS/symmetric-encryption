## Bounded Kontext

Der Kontext Assessment produziert das Event, sobald ein Customer Success Manager befindet, dass ein Student sich generell für die Zusammenarbeit mit jobvalley eignet.

Es ist möglich, dass ein Student, der sich einmal für jobvalley eignete, sich irgendwann nicht mehr eignet und sich irgendwann doch wieder eignet. Daher kann sich dieses Geeignet-Event mehrfach für einen Studenten ereignen.

## Felder des Events

| Name                                           | Typ    | Pflichtfeld | Beschreibung                                       |
| ---------------------------------------------- | ------ | ----------- | -------------------------------------------------- |
| bestaetigt_eignung_von_student_fuer_studitemps | Object | Pflicht     | Student, dessen generelle Eignung bestätigt wurde |

## Felder von bestaetigt_eignung_von_student_fuer_studitemps

| Name | Typ | Pflichtfeld | Beschreibung                                   |
| ---- | --- | ----------- | ---------------------------------------------- |
| @id  | URI | Pflicht     | Global eindeutige Identifikation des Studenten |

## Transport über RabbmitMQ

| Routing Key                                 | Exchange   |
| ------------------------------------------- | ---------- |
| assessment.student-fuer-studitemps-geeignet | assessment |
