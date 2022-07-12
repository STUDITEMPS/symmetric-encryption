## Schichtplanung

Die Schichtplanung umfasst alle Business Prozesse, die mit dem _Verwalten von Schichten_ und mit der _Disponierung von Studenten in Schichten_ zu tun haben.

## Events

### Disponieren von Studenten

-  Buche Schicht (Library Event)
-  Schicht buchen fehlgeschlagen

-  Student in Schicht disponiert
-  Student aus Schicht entfernt

### Verwalten von Schichten

-  Lege Schicht an (Library Event)
-  Schicht anlegen fehlgeschlagen
-  Schicht angelegt

-  Schicht entfernt

-  Erhöhe Anzahl benötigter Studenten in Schicht (Library Event)
-  Anzahl benötigter Studenten in Schicht erhöht
-  [DEPRECATED] Erhöhung der Anzahl benötigter Studenten in Schicht abgelehnt
-  Erhöhung der Anzahl benötigter Studenten in Schicht fehlgeschlagen

-  Verringere Anzahl benötigter Studenten in Schicht (Library Event)
-  Anzahl benötigter Studenten in Schicht verringert
-  Verringern der Anzahl benötigter Studenten in Schicht fehlgeschlagen

- Besetzungsstand in Schicht geändert (Summary Event der Schichtplanung)

### Buchen von Einsatzzeiten

- Einsatzzeit buchen fehlgeschlagen

## Glossar

| Name              | Beschreibung                                                                                           |
| ----------------- | ------------------------------------------------------------------------------------------------------ |
| Student           | Student der einem Auftrag zugewiesen wurde.                                                            |
| Schicht           | Schicht mit konkreten Anfangs- und Endzeitpunkt.                                                       |
| Flextime          | Schicht übermehrere Tage mit festgelegter Wochenarbeitszeit und unbekannten genauen AWochenarbeitszeit |
| abstrakte Schicht | Flextimes werden mitunter auch abstrakte Schichten genannt.                                            |

Der Kontext "Schichtplanung" liegt aktuell in Staffing. Es gibt in diesem Kontext jedoch Library Events, die aus anderen Kontexten geworfen werden können.
