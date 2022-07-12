## Bounded Kontext

Der Kontext Assessment produziert das Event, sobald ein Recruiter befindet, dass ein Student sich generell NICHT für die Zusammenarbeit mit jobvalley eignet.

Es ist möglich, dass ein Student, der sich einmal für jobvalley eignete, sich irgendwann nicht mehr eignet und sich irgendwann doch wieder eignet. Daher kann sich dieses Nicht-Geeignet-Event mehrfach für einen Studenten ereignen.

## Felder des Events

| Name                                         | Typ    | Pflichtfeld | Beschreibung                                     |
| -------------------------------------------- | ------ | ----------- | ------------------------------------------------ |
| verneint_eignung_von_student_fuer_studitemps | Object | Pflicht     | Student, dessen generelle Eignung verneint wurde |

## Felder von verneint_eignung_von_student_fuer_studitemps

| Name | Typ | Pflichtfeld | Beschreibung                                   |
| ---- | --- | ----------- | ---------------------------------------------- |
| @id  | URI | Pflicht     | Global eindeutige Identifikation des Studenten |

## Transport über RabbmitMQ

| Routing Key                                       | Exchange   |
| ------------------------------------------------- | ---------- |
| assessment.student-nicht-fuer-studitemps-geeignet | assessment |
