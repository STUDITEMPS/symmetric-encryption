## Besetzungsstand in Schicht geändert

## Bounded Kontext

Die Schichtplanung (aktuell Staffing) produziert das Event, sobald sich der Besetzungsstand einer Schicht geändert hat.

Dies kann passieren, wenn

-   eine Schicht angelegt wird (ändert Soll)
-   eine Schicht entfernt wird (ändert Soll auf 0)
-   eine Schicht auf/abbestellt wird (ändert Soll)
-   ein Student eingestellt oder storniert wird (ändert Ist)
-   ein Student, der in dieser Schicht eingestellt war, ist im Urlaub oder krank (ändert Ist)
-   ein Student, der in dieser Schicht eingestellt war, wird als unentschuldigt gefehlt markiert (ändert Ist)

Es ist möglich und durchaus wahrscheinlich, dass dieses Event vor den anderen Events (angelegt, entfernt, ...) publiziert wird.


## Feldname

`dokumentiert_aenderung_von_besetzungsstand`

## Felder von dokumentiert_aenderung_von_besetzungsstand

| Name       | Typ     | Pflichtfeld | Beschreibung                                                        |
| ---------- | ------- | ----------- | ------------------------------------------------------------------- |
| in_schicht | URI     | Pflicht     | URI der Schicht                                                     |
| ist        | Integer | Pflicht     | Anzahl aktuell eingestellter (und nicht Krankheit/Urlaub) Studenten |
| soll       | Integer | Pflicht     | Anzahl der aktuell insgesamt gesuchten Studenten                    |

## Transport über RabbmitMQ

| Routing Key                                         | Exchange       |
| --------------------------------------------------- | -------------- |
| schichtplanung.besetzungsstand-in-schicht-geaendert | schichtplanung |
