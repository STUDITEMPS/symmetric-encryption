# Wochenstunden festgelegt

Das Event wird vom Kandidatenprofil produziert, wenn die Anforderung an die Wochenstunden des Kandidaten neu festgelegt wurde.
Die Wochenstunden können dabei zum ersten Mal oder erneut festgelegt werden.
Sie beschreiben die vom Kandidaten benötigte reine Arbeitszeit. Es kann sich dabei um eine Zeitspanne handeln oder eine feste Anzahl an Stunden.

## Feldname

`legt_wochenstunden_fest`

## Felder von `legt_wochenstunden_fest`

| Name          | Typ              | Pflichtfeld | Beschreibung                                                 |
| ------------- | ---------------- | ----------- | ------------------------------------------------------------ |
| fuer_auftrag  | URI              | Pflicht     | URI des Auftrags, für den die Wochenstunden festgelegt wurde. |
| wochenstunden | ISO8601 Duration | Pflicht     | Wochenstunden                                                |

### `wochenstunden`

Hierbei handelt es sich um die Wochenstunden. Beispiele:

-   `PT12H` 12 Stunden
-   `PT16H/PT20H` 16 - 20 Stunden
-   `PT12H30M` 12,5 Stunden

## Transport über RabbmitMQ

| Routing Key                               | Exchange         |
| ----------------------------------------- | ---------------- |
| kandidatenprofil.wochenstunden-festgelegt | kandidatenprofil |
