## Einsatzort festgelegt

## Bounded Kontext

Das Stellenprofil produziert das Event, sobald ein Einsatzort für den Auftrag festgelegt wird. Der Einsatzort kann ständig geändert werden, so dass auch Korrekturen möglich sind. Der Einsatzort kann nach dem Erstellen nicht mehr gelöscht werden. Updates werden auch mit diesem Event publiziert.

Alle Felder der Adresse kommen aus Zendesk Sell und können dort nicht validiert werden.

## Feldname

`legt_einsatzort_fest`

## Felder von legt_einsatzort_fest

| Name | Typ  | Pflichtfeld  | Beschreibung |
|---|---|---|---|
| @type | URI | Pflicht | Type |
| fuer_auftrag | URI | Pflicht | Datum, ab dem die Wochenarbeitszeit für diesen Auftrag galt. |
| plz | String | Pflicht | Kann ungültige PLZ enthalten. |
| stadt | String | Pflicht | |
| strasse | String | Pflicht | |
| hausnummer | String | Optional | |
| bundesland | String | Pflicht | |
| land | String | Pflicht | |
| latitude | String | Pflicht | |
| longitude | String | Pflicht | |

## Transport über RabbmitMQ

| Routing Key | Exchange |
|---|---|
| stellenprofil.einsatzort_festgelegt | stellenprofil |
