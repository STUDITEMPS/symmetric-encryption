## Einsatzbeginn festgelegt

## Bounded Kontext

Temping produziert das Event, sobald der Einsatzbeginn eines Auftrags festgelegt wurde. Der Einsatzbeginn kann sich jederzeit ändern.
Beim Ändern des Einsatzbeginns wird darauf geachtet, dass keine Dispositionen vor dem neuen Einsatzbeginn liegen. Der Einsatzbeginn ist wichtig für die Überlassungsvereinbarung.

## Feldname

`legt_einsatzbeginn_fest`

## Felder von legt_einsatzbeginn_fest

| Name          | Typ           | Pflichtfeld | Beschreibung                                    |
| ------------- | ------------- | ----------- | ----------------------------------------------- |
| fuer_auftrag  | URI           | Pflicht     | Auftrag, dessen Einsatzbeginn festgelegt wurden |
| einsatzbeginn | ISO8601 Datum | Pflicht     | Beginn des Einsatzzeitraums                     |

## Transport über RabbmitMQ

| Routing Key                      | Exchange |
| -------------------------------- | -------- |
| temping.einsatzbeginn-festgelegt | temping  |

## Anmerkungen

Der Kontext ist erstmal Temping. Eigentlich gehört das eher in einen Vertragskontext, der bei Legal oder im Kundenportal liegt. Temporär hier angesiedelt, weil die Daten hier erfasst werden. Dieses Domain Event ersetzt ein bestehendes Legacy Event, das von Legal konsumiert wird.
