# Individueller Tätigkeitsprofilname festgelegt

## Bounded Kontext

Auftragskonfiguration produziert das Event, wenn für einen Auftrag ein individueller Tätigkeitsprofilname hinterlegt wird.

1.  Der Individuelle Tätigkeitsprofilname ist eine optionale genauere Beschreibung des Tätigkeitsprofils in der Sprache des Kundenunternehmens.
2.  Es handelt sich um ein Freitextfeld.
3.  Wenn verfügbar, soll der Name anstelle unseres Tätigkeitsprofils benutzt werden für Kundenkommunikation. Zum Bsp. ist aktuell geplant, den Namen in der Einsatzmeldung, Vertragsdokumenten mit dem Kundenunternehmen und der Auftragsübersicht zu benutzen.
4.  Zu beachten ist, dass der Name für die Außenkommunikation gedacht ist.

## Feldname

`legt_individuellen_taetigkeitsprofilnamen_fest`

## Felder von legt_individuellen_taetigkeitsprofilnamen_fest

| Name                  | Typ    | Pflichtfeld | Beschreibung                                               |
| --------------------- | ------ | ----------- | ---------------------------------------------------------- |
| fuer_auftrag          | URI    | Pflicht     | URI des Auftrags für den das Unternehmen festgelegt wurde. |
| taetigkeitsprofilname | String | Pflicht     | Individueller Tätikeitsprofilname                          |

## Transport über RabbmitMQ

| Routing Key                                                          | Exchange              |
| -------------------------------------------------------------------- | --------------------- |
| auftragskonfiguration.individueller-taetigkeitsprofilname-festgelegt | auftragskonfiguration |
