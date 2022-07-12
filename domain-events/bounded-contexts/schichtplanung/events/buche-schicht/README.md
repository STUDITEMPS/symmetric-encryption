## Buche Schicht

**Typ**: Library Event

## Bounded Context

Der Command _Buche Schicht_ wird als Event geworfen, nachdem außerhalb des Bounded Contexts _Schichtplanung_ ein Student sich in eine Schicht einbucht.

Der Bounded Context _Schichtplanung_ entscheidet, ob ein Student sich in diese Schicht einbuchen kann. Wenn das funktioniert hat, wird das Event[_Student_In_Schicht_Disponiert_](../student-in-schicht-disponiert/README.md) produziert. Im Fehlerfall wird das Event [_Schicht Buchen Fehlgeschlagen_](../schicht-buchen-fehlgeschlagen/README.md) produziert.

## Felder

`bucht_schicht`

## Felder von bucht_schicht

| Name    | Typ | Pflichtfeld | Beschreibung                                |
| ------- | --- | ----------- | ------------------------------------------- |
| student | URI | Pflicht     | Student, der sich in eine Schicht einbucht. |
| schicht | URI | Pflicht     | Schicht, in die der Student sich einbucht   |

## Transport über RabbmitMQ

| Routing Key                  | Exchange       |
| ---------------------------- | -------------- |
| schichtplanung.buche-schicht | schichtplanung |
