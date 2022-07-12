# Tätigkeitsfelder festgelegt

Das Event wird vom Kandidatenprofil produziert, wenn die Anforderungen an die Tätigkeitsfelder des Kandidaten neu festgelegt wurden. Die Tätigkeitsfelder können dabei zum ersten Mal oder erneut festgelegt worden sein.

> ℹ️ Die Interpretation der unterschiedlichen Tätigkeitsfelder ist subjektiv und nicht genau definiert.

## Felder von `legt_taetigkeitsfelder_fest`

| Name              | Typ   | Pflichtfeld | Beschreibung                                            |
| ----------------- | ----- | ----------- | ------------------------------------------------------- |
| fuer_auftrag      | URI   | Pflicht     | Auftrag, für den die Tätigkeitsfelder festgelegt wurden |
| taetigkeitsfelder | [URI] | Pflicht     | Liste an Tätigkeitsfeldern                              |

### Tätigkeitsfelder URIs

-   `tech.studitemps:taetigkeitsfeld:buerotaetigkeiten`
-   `tech.studitemps:taetigkeitsfeld:kundenkontakt`

## Transport über RabbitMQ

| Routing Key                                   | Exchange         |
| --------------------------------------------- | ---------------- |
| kandidatenprofil.taetigkeitsfelder-festgelegt | kandidatenprofil |
