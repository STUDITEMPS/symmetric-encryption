## Lege Schicht An

__Typ__: Library Event

## Bounded Context

Der Command _Lege Schicht An_ wird als Event geworfen, nachdem außerhalb des Bounded Contexts _Schichtplanung_ eine Schicht angelegt wurde.

Der Bounded Context _Schichtplanung_ entscheidet, ob eine Schicht von einem Customer Success Manager innerhalb der _Schichtplanung_ oder von einem externen Actor angelegt werden kann und antwortet entweder mit [_Schicht Angelegt_](../../../schichtplanung/events/schicht-angelegt/README.md) oder [_Schicht Anlegen Fehlgeschlagen_](../../../schichtplanung/events/schicht-anlegen-fehlgeschlagen/README.md)

Das Schichtende wird in der Schichtplanung aktuell anhand von Startzeit und Dauer (Netto + Pause) berechnet, die Endzeit wird nicht berücksichtigt.

## Felder

`legt_schicht_an`

## Felder von legt_schicht_an

| Name | Typ  | Pflichtfeld  | Beschreibung |
|---|---|---|---|
| in_auftrag | URI | Pflicht | Auftrag, für den die Schicht hinzugefügt wurde |
| zeitraum | ISO8601 Interval | Pflicht | Zeitraum der Schicht. |
| anzahl_benoetigter_studenten | Integer | Pflicht | Anzahl der Studenten, die in der Schicht arbeiten sollen |
| netto_arbeitszeit | ISO8601 Duration | Pflicht | Nettoarbeitszeit ohne Pause. |
| pause | ISO8601 Duration | Optional | Pausendauer. |


## Transport über RabbmitMQ

| Routing Key | Exchange |
|---|---|
| schichtplanung.lege-schicht-an | schichtplanung |
