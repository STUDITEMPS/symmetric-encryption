## Verringere Anzahl benötigter Studenten in Schicht

**Typ**: Library Event

## Bounded Context

Der Command _Verringere Anzahl Benoetigter Studenten In Schicht_ wird als Event geworfen, nachdem außerhalb des Bounded Contexts _Schichtplanung_ die Anzahl benötigter Studenten in einer Schicht verringert wurde.

Der Bounded Context _Schichtplanung_ entscheidet, ob der Soll einer Schicht von einem Customer Success Manager innerhalb der _Schichtplanung_ oder von einem externen Actor verringert werden kann und antwortet entweder mit [_Anzahl Benoetigter Studenten In Schicht Verringert_](../../../schichtplanung/events/anzahl-benoetigter-studenten-in-schicht-verringert/README.md) oder [_Verringern der Anzahl Benoetigter Studenten in Schicht Fehlgeschlagen_](../../../schichtplanung/events/verringern-der-anzahl-benoetigter-studenten-in-schicht-fehlgeschlagen/README.md).

## Felder

`verringert_anzahl_benoetigter_studenten_in_schicht`

## Felder von verringert_anzahl_benoetigter_studenten_in_schicht

| Name       | Typ     | Pflichtfeld | Beschreibung                                                                |
| ---------- | ------- | ----------- | --------------------------------------------------------------------------- |
| in_schicht | URI     | Pflicht     | Schicht, für die die Anzahl der benötigten Studenten verringert werden soll |
| auf        | Integer | Pflicht     | Neue Anzahl der Studenten, die für die Schicht bestellt sind                |
| um         | Integer | Pflicht     | Wert, um den die Anzahl der Student verringert werden soll                  |
| von        | Integer | Pflicht     | Ursprüngliche Anzahl der Studenten, die für die Schicht bestellt waren     |

## Transport über RabbmitMQ

| Routing Key                                                       | Exchange       |
| ----------------------------------------------------------------- | -------------- |
| schichtplanung.verringere-anzahl-benoetigter-studenten-in-schicht | schichtplanung |
