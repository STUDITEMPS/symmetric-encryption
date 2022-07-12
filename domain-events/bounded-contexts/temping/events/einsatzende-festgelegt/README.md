## Einsatzende festgelegt

## Bounded Kontext

Temping produziert das Event, sobald das Einsatzende eines Auftrags festgelegt wurde. Das Einsatzende kann sich jederzeit ändern.
Beim Ändern des Einsatzendes wird darauf geachtet, dass keine Dispositionen nach dem neuen Einsatzzeitraum liegen. Der Einsatzzeitraum ist wichtig für die Überlassungsvereinbarung.

## Feldname

`legt_einsatzende_fest`

## Felder von legt_einsatzende_fest

| Name                       | Typ              | Pflichtfeld | Beschreibung                                                            |
| -------------------------- | ---------------- | ----------- | ----------------------------------------------------------------------- |
| fuer_auftrag               | URI              | Pflicht     | Auftrag, dessen Einsatzende festgelegt wurden                           |
| einsatzende                | ISO8601 Datum | Pflicht     | Ende des Einsatzzeitraums                                               |

## Transport über RabbmitMQ

| Routing Key                    | Exchange |
| ------------------------------ | -------- |
| temping.einsatzende-festgelegt | temping  |

## Anmerkungen

Der Kontext ist erstmal Temping. Eigentlich gehört das eher in einen Vertragskontext, der bei Legal oder im Kundenportal liegt. Temporär hier angesiedelt, weil die Daten hier erfasst werden. Dieses Domain Event ersetzt ein bestehendes Legacy Event, das von Legal konsumiert wird.
