## Bounded Kontext

Die Auftragskonfiguration produziert das Event, sobald ein Staffing-Mitarbeiter einen Auftrag gelöscht hat. Dabei wird der Auftrag nicht gelöscht, sondern nur als gelöscht markiert, um ihn nicht mehr in der Suche etc. anzuzeigen.

Ein Auftrag wird z.B. gelöscht, weil er fehlerhaft, doppelt oder als Entwurf, der nie ein richtiger Kunden-Auftrag wurde, erstellt wurde. Andere Löschgründe sind denkbar.

Ein Auftrag kann nur gelöscht werden, wenn

-   noch nie Studenten dafür eingestellt waren (auch wenn diese Einstellungen storniert wurden)
-   aktuell keine Jobmensa-Anzeige geschaltet ist

Aktuell ist es nach dem Löschen eines Auftrags weiterhin möglich, Schichten dafür zu erstellen und Studenten einzustellen.

Das Einstellen von Studenten wird bald von Staffing verhindert.

## Felder des Events

| Name            | Typ    | Pflichtfeld | Beschreibung                        |
| --------------- | ------ | ----------- | ----------------------------------- |
| loescht-auftrag | Object | Pflicht     | Der im Event mitgelieferte Auftrag. |

## Felder von loescht-auftrag

| Name | Typ | Pflichtfeld | Beschreibung                                   |
| ---- | --- | ----------- | ---------------------------------------------- |
| @id  | URI | Pflicht     | Global eindeutige Identifikation des Auftrags. |

## Transport über RabbmitMQ

| Routing Key                          | Exchange              |
| ------------------------------------ | --------------------- |
| auftragskonfiguration.auftrag-geloescht | auftragskonfiguration |
