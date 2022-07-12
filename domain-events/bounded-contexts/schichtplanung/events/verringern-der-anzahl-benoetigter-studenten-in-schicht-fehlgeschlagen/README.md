## Verringern der Anzahl benoetigter Studenten in Schicht fehlgeschlagen

## Bounded Context

Die Schichtplanung (aktuell Staffing) produziert das Event, wenn das Abbestellen einer Schicht nach Anfrage durch das Command Event [_VerringereAnzahlBenoetigterStudentenInSchicht_](../../../schichtplanung/events/verringere-anzahl-benoetigter-studenten-in-schicht/README.md) eines anderen Kontexts fehlgeschlagen ist.

## Felder

`kann_anzahl_der_studenten_in_schicht_nicht_verringern`

## Felder von kann_anzahl_der_studenten_in_schicht_nicht_verringern

| Name       | Typ   | Pflichtfeld | Beschreibung                                                           |
| ---------- | ----- | ----------- | ---------------------------------------------------------------------- |
| in_schicht | URI   | Pflicht     | Schicht, in der die Anzahl der Studenten nicht reduziert werden konnte |
| gruende    | Array | Pflicht     | Gründe für das Fehlschlagen des Verringerns der Anzahl                 |

## Mögliche Ablehngründe

jeweils als `tech.studitemps:schichtplanung:verringern-der-anzahl-benoetigter-studenten-in-schicht-abgelehnt-grund:[grund]`

-   `anfrage-veraltet` (zeitgleich hat Customer Success Manager oder (anderer Kunde) ebenfalls Verringerung angefragt, von passt nicht zur aktuellen Schicht)
-   `anfrage-ungueltig` (von/auf/um passt nicht zusammen oder um/auf ist negativ)
-   `schicht-nicht-gefunden` (könnte in der Zwischenzeit gelöscht worden sein)
-   `unbekannter-fehler` (sollte nicht vorkommen)
                                                                                  \|

## Transport über RabbmitMQ

| Routing Key                                                                          | Exchange       |
| ------------------------------------------------------------------------------------ | -------------- |
| schichtplanung.verringern-der-anzahl-benoetigter-studenten-in-schicht-fehlgeschlagen | schichtplanung |
