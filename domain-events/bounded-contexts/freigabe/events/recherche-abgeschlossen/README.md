# Recherche abgeschlossen

## Bounded Kontext

Der _Freigabe_ Bounded Context produziert das Event, wenn ein Time Tracking Specialist alle in einem Auftrag angefallenen Arbeitszeiten für einen Zeitraum so gut es geht recherchiert und somit die Recherche abgeschlossen hat.

Da jederzeit weitere Arbeitszeiten für vergangene Zeiträume hinzukommen, angepasst oder gelöscht werden können, ist es möglich, dass weitere Recherchen notwendig werden. Diese Abschlüsse führen zu einer neuen Version der Recherche.

### Zeitraum

Der Zeitraum wird anhand des Rechnungsturnus des zugehörigen Auftrags ermittelt, also z. B. _KW 23-2021_, _März 2021._ oder auch _26.04. bis 30.04.2021_. "Halbe" Wochen können entstehen, wenn z. B. auf einen wöchentlichen Rechnungsturnus ein monatlicher folgt.

## Feldname

`schliesst_recherche_ab`

## Felder von `schliesst_recherche_ab`

|           Name            |                                    Typ                                    | Pflichtfeld |                                                          Beschreibung                                                           |
| ------------------------- | ------------------------------------------------------------------------- | ----------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `@id`                     | [URI](https://tools.ietf.org/html/rfc3986)                                | Pflicht     | Global eindeutige Identifikation des Recherchepakets.                                                                 |
| `fuer_zeitraum` | [ISO8601 Interval](https://en.wikipedia.org/wiki/ISO_8601#Time_intervals) | Pflicht     | Bei der Recherche betrachteter Zeitraum. Das Ende ist miteingeschlossen. Der Zeitraum ist Datumsbasiert. |
| `in_auftrag`              | [URI](https://tools.ietf.org/html/rfc3986)                                | Pflicht     | Global eindeutige Identifikation des Auftrags                                                                                   |
| `mit_arbeitszeiten`       | Liste aus [URI](https://tools.ietf.org/html/rfc3986)                      | Pflicht     | Führt die IDs aller recherchierten Arbeitszeiten auf.                     |
| `version`                 | Integer                                                                   | Pflicht     | Gibt an ob die Recherche erstmalig oder zum wiederholten male abgeschlossen wurde. Startet bei 1.                             |

Es wird grundsätzlich die deutsche Zeitzone angenommen.

## Transport über RabbmitMQ

|                Routing Key                |  Exchange  |
| ----------------------------------------- | ---------- |
| `freigabe.recherche-abgeschlossen` | `freigabe` |
