## Bounded Kontext

Die Auftragskonfiguration produziert das Event, sobald eine Zeiterfassungsart für den Auftrag festgelegt wird. Die Zeiterfassungsart kann jederzeit geändert werden.

## Felder des Events

| Name                        | Typ    | Pflichtfeld | Beschreibung                       |
| --------------------------- | ------ | ----------- | ---------------------------------- |
| legt_zeiterfassungsart_fest | Object | Pflicht     | Die festgelegte Zeiterfassungsart. |

## Felder von legt_zeiterfassungsart_fest

| Name         | Typ | Pflichtfeld | Beschreibung                                                                                                                                                                                                                                                                                                                              |
| ------------ | --- | ----------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| @type        | URI | Pflicht     | URI Repräsentation der Zeiterfassungsart. Mögliche Ausprägungen: <ul><li>tech.studitemps:auftragskonfiguration:zeiterfassungsart:studentenzeiterfassung</li><li>tech.studitemps:auftragskonfiguration:zeiterfassungsart:unternehmenszeiterfassung</li><li>tech.studitemps:auftragskonfiguration:zeiterfassungsart:stundenzettel</li></ul> |
| fuer_auftrag | URI | Pflicht     | Auftrag, für den die Zeiterfassungart festgelegt wurde                                                                                                                                                                                                                                                                                    |

## Transport über RabbmitMQ

| Routing Key                                        | Exchange              |
| -------------------------------------------------- | --------------------- |
| auftragskonfiguration.zeiterfassungsart-festgelegt | auftragskonfiguration |
