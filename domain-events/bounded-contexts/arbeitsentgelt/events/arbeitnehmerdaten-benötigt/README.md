## Arbeitnehmerdaten benötigt

Typ: Request Event

## Bounded Kontext

_Arbeitsentgelt_ produziert dieses Event, wenn die Arbeitnehmerdaten für eine
Arbeitszeit benötigt werden, hier nur die Personalnummer. Später können auch
andere Informationen dazu kommen. Von dem Empfänger wird eine asynchrone Antwort
auf diese Nachricht erwartet. Die Routing-Informationen der Antwort (`exchange`
und `routing_key`) und die für den Empfänger transparenten Metadaten, die
genauso wieder zurückgeschickt werden müssen, werden im `reply`-Feld
spezifiziert.


## Feldname

`arbeitnehmerdaten_benoetigt`

## Felder von `arbeitnehmerdaten_benoetigt`

|       Name       |  Typ  | Pflichtfeld |                                                              Beschreibung                                                              |
| ---------------- | ----- | ----------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| `fuer`             | [URI](https://tools.ietf.org/html/rfc3986)   | Pflicht     | Die Arbeitnehmer/Studenten ID als URI                                                                                                  |
| `benoetigte_daten` | Liste | Pflicht     | Eine Liste mit verschiedenen Feldern, hier `[personalnummer]`. Es wird erwartet, dass die Antwort eine Map mit diesen Feldern enthält. |

## Transport über RabbmitMQ

|                  Routing Key                  |   Exchange   |
| --------------------------------------------- | ------------ |
| `arbeitnehmerverwaltung.arbeitnehmerdaten-benoetigt` | `arbeitnehmerverwaltung` |
