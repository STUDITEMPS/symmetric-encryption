## Buche Einsatzzeit

**Typ**: Library Event

## Bounded Context

Der Command _Buche Einsatzzeit_ wird als Event geworfen, nachdem außerhalb des Bounded Contexts _Schichtplanung_ ein Student eine Einsatzzeit bucht.

Der Bounded Context _Schichtplanung_ entscheidet, ob ein Student diese Einsatzzeit selbst buchen kann. Aktuell wird dabei für die Einsatzzeit eine Schicht angelegt und der Student anschließend automatisch in dieser Schicht disponiert. Wenn sowohl die Schichtanlage als auch das Disponieren erfolgreich war, werden die normalen zugehörigen Erfolgsevents [_Schicht Angelegt_](../schicht-angelegt/README.md) und [_Student_In_Schicht_Disponiert_](../student-in-schicht-disponiert/README.md) produziert. Im Fehlerfall wird das Event [_Einsatzzeit Buchen Fehlgeschlagen_](../einsatzzeit-buchen-fehlgeschlagen/README.md) produziert.

Das Schichtende wird in der Schichtplanung aktuell anhand von Startzeit und Dauer (Netto + Pause) berechnet, die Endzeit wird nicht berücksichtigt.

## Felder

`bucht_einsatzzeit`

## Felder von bucht_einsatzzeit

| Name              | Typ              | Pflichtfeld | Beschreibung                                         |
| ----------------- | ---------------- | ----------- | ---------------------------------------------------- |
| student           | URI              | Pflicht     | Student der selbst seine Einsatzzeit bucht.          |
| in_auftrag        | URI              | Pflicht     | Auftrag, für den die Einbuchung gemacht werden soll. |
| in_zeitraum       | ISO8601 Interval | Pflicht     | Zeitraum der Einsatzzeit.                            |
| netto_arbeitszeit | ISO8601 Duration | Pflicht     | Nettoarbeitszeit ohne Pause.                         |
| pause             | ISO8601 Duration | Optional    | Pausendauer.                                         |

## Transport über RabbmitMQ

| Routing Key                      | Exchange       |
| -------------------------------- | -------------- |
| schichtplanung.buche-einsatzzeit | schichtplanung |
