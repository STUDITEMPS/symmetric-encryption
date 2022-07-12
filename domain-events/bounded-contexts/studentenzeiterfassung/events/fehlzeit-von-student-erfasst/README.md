## Fehlzeit von Student erfasst

## Bounded Kontext

Die Studentenzeiterfassung produziert das Event sobald ein Student für eine geplante Schicht das erfassen einer Arbeitszeit ablehnt.

## Feldname

`dokumentiert_fehlzeit`

## Felder von dokumentiert_fehlzeit

|     Name     | Typ | Pflichtfeld |                  Beschreibung                   |
| ------------ | --- | ----------- | ----------------------------------------------- |
| von_student  | URI | Pflicht     | Global eindeutige Identifikation des Studenten. |
| fuer_schicht | URI | Pflicht     | Global eindeutige Identifikation der Schicht.   |
| in_auftrag   | URI | Pflicht     | Global eindeutige Identifikation des Auftrags.  |

## Transport über RabbmitMQ
|                     Routing Key                     |        Exchange        |
| --------------------------------------------------- | ---------------------- |
| studentenzeiterfassung.fehlzeit-von-student-erfasst | studentenzeiterfassung |
