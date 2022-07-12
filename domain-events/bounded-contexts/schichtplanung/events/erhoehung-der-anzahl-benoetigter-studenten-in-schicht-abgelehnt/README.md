# ⚠️ Deprecated

Die vorherigen beiden Events [ErhoehungDerAnzahlBenoetigterStudentenInSchichtBeantragt](../../../schichtbestellung/events/erhoehung-der-anzahl-benoetigter-studenten-in-schicht-beantragt/README.md) und [ErhoehungDerAnzahlBenoetigterStudentenInSchichtAbgelehnt](README.md) werden durch das Library Event [ErhoeheAnzahlBenoetigterStudentenInSchicht](../erhoehe-anzahl-benoetigter-studenten-in-schicht/README.md) und die Antwort darauf [ErhoehenDerAnzahlBenoetigterStudentenInSchichtFehlgeschlagen](../erhoehen-der-anzahl-benoetigter-studenten-in-schicht-fehlgeschlagen/README.md) abgelöst.

## Erhöhung der Anzahl benötigter Studenten in Schicht abgelehnt

## Bounded Kontext

Die Schichtplanung (aktuell Staffing) publiziert das Event, sobald eine angefragte Erhöhung der in einer Schicht benötigten Studenten abgelehnt wurde.

## Feldname

`lehnt_erhoehung_der_anzahl_benoetigter_studenten_in_schicht_ab`

## Felder von lehnt_erhoehung_der_anzahl_benoetigter_studenten_in_schicht_ab

| Name       | Typ     | Pflichtfeld | Beschreibung                                                   |
| ---------- | ------- | ----------- | -------------------------------------------------------------- |
| in_auftrag | URI     | Pflicht     | URI des Auftrages                                              |
| in_schicht | URI     | Pflicht     | URI der Schicht                                                |
| von        | Integer | Pflicht     | Urspruengliche Anzahl bestellter Studenten                     |
| auf        | Integer | Pflicht     | Neue Anzahl der Studenten, die für die Schicht bestellt wurden |
| um         | Integer | Pflicht     | Anzahl, um die die bestellten Studenten erhöht werden sollten  |
| gruende    | Array   | Pflicht     | Sammlung für die Gründe der Ablehnung. Erhöht die Transparenz  |

## Mögliche Ablehngründe

jeweils als `tech.studitemps:schichtplanung:erhoehung-der-anzahl-benoetigter-studenten-in-schicht-abgelehnt-grund:[grund]`

-   `anfrage-veraltet` (zeitgleich hat Customer Success Manager oder (anderer Kunde) ebenfalls Erhöhung angefragt, von passt nicht zur aktuellen Schicht)
-   `anfrage-ungueltig` (von/auf/um passt nicht zusammen oder um ist negativ)
-   `schicht-nicht-gefunden` (könnte in der Zwischenzeit gelöscht worden sein)
-   `auftrag-nicht-gefunden` (sollte nicht vorkommen)
-   `unbekannter-fehler` (sollte ebenfalls nicht vorkommen)

## Transport über RabbmitMQ

| Routing Key                                                                    | Exchange       |
| ------------------------------------------------------------------------------ | -------------- |
| schichtplanung.erhoehung-der-anzahl-benoetigter-studenten-in-schicht-abgelehnt | schichtplanung |
