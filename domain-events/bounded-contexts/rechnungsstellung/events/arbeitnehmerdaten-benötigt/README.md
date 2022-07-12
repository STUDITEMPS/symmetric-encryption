## Arbeitnehmerdaten benötigt

Typ: Request Event

## Bounded Kontext

Die Rechnungsstellung produziert dieses Event, wenn die Arbeitnehmerdaten für eine Arbeitszeit benötigt werden, hier Vorname, Nachname, Personalnummer. Später können auch andere Informationen dazu kommen.
Von dem Empfänger wird eine asynchrone Antwort auf diese Nachricht erwartet. Die Routing-Informationen der Antwort (`exchange` und `routing_key`) und die für den Empfänger transparenten Metadaten, die genauso
wieder zurückgeschickt werden müssen, werden im `reply`-Feld spezifiziert.


## Feldname

`arbeitnehmerdaten_benoetigt`

## Felder von `arbeitnehmerdaten_benoetigt`

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| fuer | URI | Pflicht | Die Arbeitnehmer/Studenten ID als URI |
| benoetigte_daten  | Liste  | Pflicht  | Eine Liste mit verschiedenen Feldern, hier `[vorname, nachname, personalnummer]`. Es wird erwartet, dass die Antwort eine Map mit diesen Feldern enthält.|

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| rechnungsstellung.arbeitnehmerdaten-benoetigt | timetracking  |
