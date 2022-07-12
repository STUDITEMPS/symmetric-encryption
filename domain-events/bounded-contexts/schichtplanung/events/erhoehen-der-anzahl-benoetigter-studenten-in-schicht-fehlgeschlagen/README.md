## Erhöhen der Anzahl benötigter Studenten in Schicht fehlgeschlagen

## Bounded Context

Die Schichtplanung (aktuell Staffing) produziert das Event, wenn das Erhöhen der Anzahl der benötigten Studenten in einer Schicht nach Anfrage durch das Command Event [_ErhoeheAnzahlBenoetigterStudentenInSchicht_](../../../schichtplanung/events/erhoehe-anzahl-benoetigter-studenten-in-schicht/README.md) eines anderen Kontexts fehlgeschlagen ist.

Dieses Event ersetzt das bisherige Event [_ErhoehungDerAnzahlBenoetigterStudentenInSchichtAbgelehnt_](../../../schichtplanung/events/erhoehung-der-anzahl-benoetigter-studenten-in-schicht-abgelehnt/README.md).

## Felder

`kann_anzahl_der_studenten_in_schicht_nicht_erhoehen`

## Felder von kann_anzahl_der_studenten_in_schicht_nicht_erhoehen

| Name       | Typ   | Pflichtfeld | Beschreibung                                                         |
| ---------- | ----- | ----------- | -------------------------------------------------------------------- |
| in_schicht | URI   | Pflicht     | Schicht, für den die Anzahl der Studenten nicht erhöht werden konnte |
| gruende    | Array | Pflicht     | Gründe für das Fehlschlagen                                          |

## Mögliche Ablehngründe

jeweils als `tech.studitemps:schichtplanung:erhoehen-der-anzahl-benoetigter-studenten-in-schicht-fehlgeschlagen-grund:[grund]`

-   `anfrage-veraltet` (zeitgleich hat Customer Success Manager oder (anderer Kunde) ebenfalls Erhöhung angefragt, von passt nicht zur aktuellen Schicht)
-   `anfrage-ungueltig` (von/auf/um passt nicht zusammen oder um ist negativ)
-   `schicht-nicht-gefunden` (könnte in der Zwischenzeit gelöscht worden sein)
-   `unbekannter-fehler` (sollte nicht vorkommen)

## Transport über RabbmitMQ

| Routing Key                                                                        | Exchange       |
| ---------------------------------------------------------------------------------- | -------------- |
| schichtplanung.erhoehen-der-anzahl-benoetigter-studenten-in-schicht-fehlgeschlagen | schichtplanung |
