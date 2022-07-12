## Einsatzende entfernt

## Bounded Kontext

Temping produziert das Event, sobald das Einsatzende eines Auftrags entfernt wurde. Dies kann jederzeit passieren, egal, in welchem Status sich ein Auftrag befindet.

## Feldname

`entfernt_einsatzende`

## Felder von entfernt_einsatzende

| Name         | Typ | Pflichtfeld | Beschreibung                               |
| ------------ | --- | ----------- | ------------------------------------------ |
| fuer_auftrag | URI | Pflicht     | Auftrag, dessen Einsatzende entfernt wurde |

## Transport über RabbmitMQ

| Routing Key                  | Exchange |
| ---------------------------- | -------- |
| temping.einsatzende-entfernt | temping  |

## Anmerkungen

Der Kontext ist erstmal Temping. Eigentlich gehört das eher in einen Vertragskontext, der bei Legal oder im Kundenportal liegt. Temporär hier angesiedelt, weil die Daten hier erfasst werden. Dieses Domain Event ersetzt ein bestehendes Legacy Event, das von Legal konsumiert wird.
