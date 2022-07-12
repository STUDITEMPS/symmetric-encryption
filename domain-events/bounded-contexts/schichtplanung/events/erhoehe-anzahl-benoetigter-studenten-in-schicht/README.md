## Erhöhe Anzahl benötigter Studenten in Schicht

**Typ**: Library Event

## Bounded Context

Der Command _Erhoehe Anzahl Benoetigter Studenten In Schicht_ wird als Event geworfen, nachdem außerhalb des Bounded Contexts _Schichtplanung_ die Anzahl benötigter Studenten in einer Schicht erhoeht wurde.

Der Bounded Context _Schichtplanung_ entscheidet, ob der Soll einer Schicht von einem Customer Success Manager innerhalb der _Schichtplanung_ oder von einem externen Actor erhoeht werden kann und antwortet entweder mit [_Anzahl Benoetigter Studenten In Schicht Erhoeht_](../../../schichtplanung/events/anzahl-benoetigter-studenten-in-schicht-erhoeht/README.md) oder [_Erhoehen der Anzahl Benoetigter Studenten in Schicht Fehlgeschlagen_](../../../schichtplanung/events/erhoehen-der-anzahl-benoetigter-studenten-in-schicht-fehlgeschlagen/README.md).

Dieses Event ersetzt das bisherige Event [_ErhoehungDerAnzahlBenoetigterStudentenInSchichtBeantragt_](../../../schichtbestellung/events/erhoehung-der-anzahl-benoetigter-studenten-in-schicht-beantragt/README.md) aus dem Schichtbestellung-Kontext.

## Felder

`erhoeht_anzahl_benoetigter_studenten_in_schicht`

## Felder von erhoeht_anzahl_benoetigter_studenten_in_schicht

| Name       | Typ     | Pflichtfeld | Beschreibung                                                            |
| ---------- | ------- | ----------- | ----------------------------------------------------------------------- |
| in_schicht | URI     | Pflicht     | Schicht, für die die Anzahl der benötigten Studenten erhöht werden soll |
| von        | Integer | Pflicht     | Ursprüngliche Anzahl der Studenten, die für die Schicht bestellt waren  |
| auf        | Integer | Pflicht     | Neue Anzahl der Studenten, die für die Schicht bestellt sind            |
| um         | Integer | Pflicht     | Anzahl, um die die Anzahl der Student erhöht wurde.                     |

## Transport über RabbmitMQ

| Routing Key                                                    | Exchange       |
| -------------------------------------------------------------- | -------------- |
| schichtplanung.erhoehe-anzahl-benoetigter-studenten-in-schicht | schichtplanung |
