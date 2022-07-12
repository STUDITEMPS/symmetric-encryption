## Anzahl Gewuenschter Mitarbeiter Festgelegt

## Bounded Kontext

Temping produziert das Event, sobald die Anzahl an Menschen, die beim Kunden auftauchen sollen, für einen Auftrag festgelegt wurde. Diese Zahl kann sich jederzeit ändern.
Der Wert ist nur wichtig für die Überlassungsvereinbarung. Dort wird er als "Anzahl gewünschter Mitarbeiter" aufgeführt. In Temping heißt er aktuell "Maximale Anzahl zeitgleich anwesender Student:innen"

## Feldname

`legt_anzahl_gewuenschter_mitarbeiter_fest`

## Felder von legt_anzahl_gewuenschter_mitarbeiter_fest

| Name         | Typ     | Pflichtfeld | Beschreibung                                           |
| ------------ | ------- | ----------- | ------------------------------------------------------ |
| fuer_auftrag | URI     | Pflicht     | Auftrag, für den die Anzahl festgelegt wurden          |
| anzahl       | Integer | Pflicht     | Anzahl an Mitarbeitern, die das Unternehmen haben will |

## Transport über RabbmitMQ

| Routing Key                                        | Exchange |
| -------------------------------------------------- | -------- |
| temping.anzahl-gewuenschter-mitarbeiter-festgelegt | temping  |

## Anmerkungen

Der Kontext ist erstmal Temping. Eigentlich gehört das eher in einen Vertragskontext, der bei Legal oder im Kundenportal liegt. Temporär hier angesiedelt, weil die Daten hier erfasst werden. Dieses Domain Event ersetzt ein bestehendes Legacy Event, das von Legal konsumiert wird.
