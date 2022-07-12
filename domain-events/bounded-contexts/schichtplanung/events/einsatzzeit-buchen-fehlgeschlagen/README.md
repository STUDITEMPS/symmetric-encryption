## Einsatzzeit buchen fehlgeschlagen

## Bounded Context

Die Schichtplanung (aktuell Staffing) produziert das Event, wenn das Buchen einer Einsatzzeit nach Anfrage durch das Command Event `BestimmeEinsatzzeit` eines anderen Kontexts fehlgeschlagen ist.

Es gibt 2 Arten von Fehlern: Die Schicht konnte nicht angelegt werden oder die Einstellung konnte nicht vorgenommen werden.

## Felder

`kann_einsatzzeit_nicht_buchen`

## Felder von kann_einsatzzeit_nicht_buchen

| Name    | Typ   | Pflichtfeld | Beschreibung                                            |
| ------- | ----- | ----------- | ------------------------------------------------------- |
| student | URI   | Pflicht     | Student, dessen Einsatzzeit nicht gebucht werden konnte |
| gruende | Array | Pflicht     | Gründe für das Fehlschlagen des Buchens der Einsatzzeit |

### Mögliche Gründe

URI-Previx jeweils: `tech.studitemps:schichtplanung:einsatzzeit-buchen-fehlgeschlagen-grund:`

| ID der URI                                                   | Fehlerursache | Beschreibung                                                                                                                                             |
| ------------------------------------------------------------ | ------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `auftrag-nicht-gefunden`                                     | Allgemein     | Auftrag nicht gefunden (zum Beispiel eine ungültige Auftragsnummer)                                                                                      |
| `auftrag-nicht-fuer-buchen-von-einsatzzeiten-freigeschaltet` | Allgemein     | Auftrag ist aktuell nicht freigeschaltet für das Buchen von Einsatzzeiten                                                                                |
| `student-nicht-einsatzbereit-fuer-auftrag`                   | Allgemein     | Student ist aktuell nicht (mehr) qualifiziert für den Auftrag                                                                                            |
| `arbeitszeitverstoss`                                        | Schichtanlage | Verstoß gegen [ArbZG §3](https://www.gesetze-im-internet.de/arbzg/BJNR117100994.html#BJNR117100994BJNG000200307) (wir überprüfen immer &lt;= 10 h) |
| `pausenzeitverstoss`                                         | Schichtanlage | Verstoß gegen [ArbZG §4](https://www.gesetze-im-internet.de/arbzg/BJNR117100994.html#BJNR117100994BJNG000200307) (wir überprüfen: Einstellungen, die weniger als 11 h auseinanderliegen, dürfen insgesamt maximal 10 h Nettoarbeitszeit haben)                                        |
| `schichtbeginn-in-vergangenheit`                             | Schichtanlage | Schicht beginnt in der Vergangenheit                                                                                                                     |
| `student-ist-krank`                                          | Einstellung   | der Student ist Krankgemeldet für den Zeitraum                                                                                                           |
| `student-hat-urlaub`                                         | Einstellung   | der Student hat Urlaub in dem Zeitraum                                                                                                                   |
| `equal-pay-erreicht`                                         | Einstellung   | der Student hat seine maximale Anzahl von Arbeitstagen für diesen Kunden, bevor Equal Pay fällig werden soll, erreicht                                   |
| `maximale-arbeitstage-ausgeschoepft`                         | Einstellung   | Ein Student, von dem wir behaupten, dass er nur 120 Tage arbeiten darf, hat diese aus Sicht von Staffing bereits erreicht                                 |
| `kein-stundenlohn-festgelegt`                                | Einstellung   | für den Auftrag wurde kein Stundenlohn festgelegt, deshalb ist eine AV-Erstellung nicht möglich, deshalb kann keine Einstellung gemacht werden           |
| `ueberlappende-einstellung`                                  | Einstellung   | Student bereits eingestellt in Schicht, die sich mit dieser Einsatzzeit überschneidet                                                                    |
| `einstellung-außerhalb-der-einsatzdauer-des-auftrags`        | Einstellung   | Schicht liegt außerhalb der einsatzdauer des Auftrags, darum kann der Student nicht in die Schicht eingestellt werden.                                   |
| `auftrag-geloescht`                                          | Einstellung   | Der Auftrag wurde als gelöscht markiert.                                                                                                                 |
| `keine-wohnadresse-vorhanden`                                | Einstellung   | jobvalley kennt keine Adresse, an die der AV adressiert werden müsste                                                                                   |
| `keine-gueltige-arbeitserlaubnis-vorhanden`                  | Einstellung   | Ein Student, von dem wir behaupten, dass er eine AE braucht, hat keine zum Einsatzzeitpunkt gültige                                                      |
| `hoechstueberlassungsdauer-erreicht`                         | Einstellung   | der Student hat seine maximale Anzahl von Arbeitstagen für diesen Kunden erreicht                                                                        |
| `keine-gueltige-ueberlassungvereinbarung-vorhanden`          | Einstellung   | es gibt keine ÜV oder diese ist nicht mehr / noch nicht gültig                                                                                           |
| `ruhezeitverstoss`                                           | Einstellung   | Verstoß gegen [ArbZG §5](https://www.gesetze-im-internet.de/arbzg/BJNR117100994.html#BJNR117100994BJNG000200307)                                         |

## Transport über RabbmitMQ

| Routing Key                                      | Exchange       |
| ------------------------------------------------ | -------------- |
| schichtplanung.einsatzzeit-buchen-fehlgeschlagen | schichtplanung |
