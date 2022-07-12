## Schicht Anlegen Fehlgeschlagen

## Bounded Context

Die Schichtplanung (aktuell Staffing) produziert das Event, wenn das Anlegen einer Schicht nach Anfrage durch das Command Event `LegeSchichtAn` eines anderen Kontexts fehlgeschlagen ist.

## Felder

`kann_schicht_nicht_anlegen`

## Felder von kann_schicht_nicht_anlegen

| Name      | Typ   | Pflichtfeld | Beschreibung                                              |
| --------- | ----- | ----------- | --------------------------------------------------------- |
| in_aufrag | URI   | Pflicht     | Auftrag, für den die Schicht nicht angelegt werden konnte |
| gruende   | Array | Pflicht     | Gründe für das Fehlschlagen des Anlegens der Schicht      |

### Mögliche Gründe

| URI                                                                                                   | Beschreibung                                                                                                     |
| ----------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `tech.studitemps:schichtplanung:schicht-anlegen-abgelehnt-grund:arbeitszeitverstoss`                  | Verstoß gegen [ArbZG §3](https://www.gesetze-im-internet.de/arbzg/BJNR117100994.html#BJNR117100994BJNG000200307) |
| `tech.studitemps:schichtplanung:schicht-anlegen-abgelehnt-grund:pausenzeitverstoss`                   | Verstoß gegen [ArbZG §4](https://www.gesetze-im-internet.de/arbzg/BJNR117100994.html#BJNR117100994BJNG000200307) |
| `tech.studitemps:schichtplanung:schicht-anlegen-abgelehnt-grund:anzahl-studenten-ungueltig`           | Die Anzahl benötigter Studenten für die Schicht ist kleiner 1                                                    |
| `tech.studitemps:schichtplanung:schicht-anlegen-abgelehnt-grund:schichtbeginn-liegt-in-vergangenheit` | Schicht beginnt in der Vergangenheit                                                                             |
| `tech.studitemps:schichtplanung:schicht-anlegen-abgelehnt-grund:auftrag-nicht-gefunden`               | Auftrag nicht gefunden                                                                                           |

## Transport über RabbmitMQ

| Routing Key                                   | Exchange       |
| --------------------------------------------- | -------------- |
| schichtplanung.schicht-anlegen-fehlgeschlagen | schichtplanung |
