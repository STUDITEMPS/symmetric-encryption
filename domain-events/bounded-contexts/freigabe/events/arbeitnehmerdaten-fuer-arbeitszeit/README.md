## Arbeitnehmerdaten fuer Arbeitszeit

Typ: _Reply_ Event

## Bounded Kontext

Dieses Event ist eine Antwort auf die Anfrage von anderen Kontexten, die Arbeitnehmerdaten anfragen. Zur Zeit ist es die Rechnungsstellung, später kommen wahrscheinlich weitere dazu.


## Feldname

`arbeitnehmerdaten`

`reply`

## Felder von `arbeitnehmerdaten`

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| `vorname` | String | Pflicht | Vorname des Arbeitnehmers|
| `nachname` | String | Pflicht | Nachname des Arbeitnehmers|
| `personalnummer` | String | Pflicht | Personalnummer des Arbeitnehmers|

## Felder von `reply`

Komplette Spiegelung des `reply` Feldes vom Request Event


## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| Inhalt von `reply.routing_key` vom Request Event | Inhalt von `reply.exchange` vom Request Event|
