# ⚠️ Deprecated

Die vorherigen beiden Events [ErhoehungDerAnzahlBenoetigterStudentenInSchichtBeantragt](README.md) und [ErhoehungDerAnzahlBenoetigterStudentenInSchichtAbgelehnt](../../../schichtplanung/events/erhoehung-der-anzahl-benoetigter-studenten-in-schicht-abgelehnt/README.md) werden durch das Library Event [ErhoeheAnzahlBenoetigterStudentenInSchicht](../../../schichtplanung/events/erhoehe-anzahl-benoetigter-studenten-in-schicht/README.md) und die Antwort darauf [ErhoehenDerAnzahlBenoetigterStudentenInSchichtFehlgeschlagen](../../../schichtplanung/events/erhoehen-der-anzahl-benoetigter-studenten-in-schicht-fehlgeschlagen/README.md) abgelöst.

## Erhöhung der Anzahl benötigter Studenten in Schicht beantragt

## Bounded Kontext

Die Schichtbestellung aus der Corporate Domäne publiziert das Event, sobald vom Kunden eine Erhöhung der in einer Schicht benötigten Studenten angefragt wurde.

## Feldname

`beantragt_erhoehung_der_anzahl_benoetigter_studenten_in_schicht`

## Felder von beantragt_erhoehung_der_anzahl_benoetigter_studenten_in_schicht

| Name       | Typ     | Pflichtfeld | Beschreibung                                                            |
| ---------- | ------- | ----------- | ----------------------------------------------------------------------- |
| in_schicht | URI     | Pflicht     | URI der Schicht                                                         |
| in_auftrag | URI     | Pflicht     | Auftrag, für den die Schicht hinzugefügt wurde                          |
| auf        | Integer | Pflicht     | Neue Anzahl der Studenten, die für die Schicht bestellt sind            |
| um         | Integer | Pflicht     | Anzahl um die die Anzahl der Student erhöht wurden.                     |
| von        | Integer | Pflicht     | Urspruengliche Anzahl der Studenten, die für die Schicht bestellt waren |

## Transport über RabbmitMQ

| Routing Key                                          | Exchange          |
| -----------------------------------------------------| ----------------- |
| schichtbestellung.erhoehung-der-anzahl-benoetigter-studenten-in-schicht-beantragt | schichtbestellung |
