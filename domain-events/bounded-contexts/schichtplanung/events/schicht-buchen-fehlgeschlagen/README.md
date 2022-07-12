## Schicht buchen fehlgeschlagen

## Bounded Context

Die Schichtplanung (aktuell Staffing) produziert das Event, wenn das Einbuchen in eine Schicht nach Anfrage durch das Command Event `BucheSchicht` eines anderen Kontexts oder (aktuell noch) das Event `SchichtVonStudentGebucht` des Schichteinbuchung-Kontexts fehlgeschlagen ist.

## Felder

`kann_schicht_nicht_buchen`

## Felder von kann_schicht_nicht_buchen

| Name    | Typ   | Pflichtfeld | Beschreibung                                              |
| ------- | ----- | ----------- | --------------------------------------------------------- |
| student | URI   | Pflicht     | Student, der sich nicht einbuchen konnte                  |
| schicht | URI   | Pflicht     | Schicht, die nicht gebucht werden konnte                  |
| gruende | Array | Pflicht     | Gründe für das Fehlschlagen des Einbuchens in die Schicht |

### Mögliche Gründe

Beispiel-Grund: `tech.studitemps:schichtplanung:schicht-buchen-fehlgeschlagen-grund:student-ist-krank`

URI-Präfix jeweils: `tech.studitemps:schichtplanung:schicht-buchen-fehlgeschlagen-grund:`

| ID der URI, die im Event mitgeschickt wird            | Legacy Failure Code als Referenz (wird nicht mitgeschickt) | Beschreibung                                                                                                                                   |
| ----------------------------------------------------- | ---------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| `auftrag-geloescht`                                   | order_deleted                                              | Der Auftrag wurde als gelöscht markiert.                                                                                                       |
| `schichtbeginn-in-vergangenheit`                      | shift_in_past                                              | Schicht schon vorbei                                                                                                                           |
| `student-ist-krank`                                   | shift_during_sick_leave                                    | der Student ist Krankgemeldet für den Zeitraum                                                                                                 |
| `student-hat-urlaub`                                  | shift_during_sick_holiday                                  | der Student hat Urlaub in dem Zeitraum                                                                                                         |
| `equal-pay-erreicht`                                  | equal_pay                                                  | der Student hat seine maximale Anzahl von Arbeitstagen für diesen Kunden, bevor Equal Pay fällig werden soll, erreicht                         |
| `maximale-arbeitstage-ausgeschoepft`                  | foreigners_work_days_limit                                 | Ein Student, von dem wir behaupten, dass er nur 120 Tage arbeiten darf, hat diese aus Sicht von Staffing bereits erreicht                       |
| `kein-stundenlohn-festgelegt`                         | hourly_rate                                                | für den Auftrag wurde kein Stundenlohn festgelegt, deshalb ist eine AV-Erstellung nicht möglich, deshalb kann keine Einstellung gemacht werden |
| `ueberlappende-einstellung`                           | overlapping_dispositions                                   | Student bereits eingestellt in Schicht, die sich mit dieser Schicht überschneidet                                                              |
| `einstellung-außerhalb-der-einsatzdauer-des-auftrags` | order_duration                                             | Schicht liegt außerhalb der Einsatzdauer des Auftrags, darum kann der Student nicht in die Schicht eingestellt werden.                         |
| `keine-wohnadresse-vorhanden`                         | candidate_address                                          | jobvalley kennt keine Adresse, an die der AV adressiert werden müsste                                                                         |
| `keine-gueltige-arbeitserlaubnis-vorhanden`           | workpermit                                                 | Ein Student, von dem wir behaupten, dass er eine AE braucht, hat keine zum Einsatzzeitpunkt gültige                                            |
| `hoechstueberlassungsdauer-erreicht`                  | hoechstueberlassungsdauer                                  | der Student hat seine maximale Anzahl von Arbeitstagen für diesen Kunden erreicht                                                              |
| `ruhezeitverstoss`                                    | ruhezeit                                                   | Verstoß gegen [ArbZG §5](https://www.gesetze-im-internet.de/arbzg/BJNR117100994.html#BJNR117100994BJNG000200307)                               |
| `schicht-voll-besetzt`                                | shift_fully_staffed                                        | Die Schicht ist bereits voll besetzt.                                                                                                          |

## Transport über RabbmitMQ

| Routing Key                                  | Exchange       |
| -------------------------------------------- | -------------- |
| schichtplanung.schicht-buchen-fehlgeschlagen | schichtplanung |
