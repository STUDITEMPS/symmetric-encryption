## Bounded Kontext

Auftragskonfiguration produziert das Event Vertragsadresse hinterlegt, sobald eine Vertragsadresse initial hinterlegt oder verändert wird.

Aktuell wird beim initialen Hinterlegen durch Übernahme der Zendesk-Adresse nichts validiert. Bei Veränderungen der Adresse werden nur für die Post valide Straße/PLZ/Ort-Kombinationen vorgeschlagen.

Dieses Event soll zeitnah in einen Vertragskontext wandern.

## Felder von hinterlegt_vertragsadresse

| Name                     | Typ    | Pflichtfeld | Beschreibung                                                                                                       |
| ------------------------ | ------ | ----------- | ------------------------------------------------------------------------------------------------------------------ |
| fuer_auftrag             | URI    | Pflicht     | URI des Auftrags, für den die Vertragsadresse hinterlegt wurde.                                                    |
| plz                      | String | Pflicht     | PLZ der Adresse                                                                                                    |
| stadt                    | String | Pflicht     | Stadt der Adresse                                                                                                  |
| strasse                  | String | Pflicht     | Straße der Adresse                                                                                                 |
| hausnummer               | String | Optional    | Hausnummer der Adresse                                                                                             |

## Transport über RabbmitMQ

| Routing Key                                      | Exchange              |
| ------------------------------------------------ | --------------------- |
| auftragskonfiguration.vertragsadresse-hinterlegt | auftragskonfiguration |
