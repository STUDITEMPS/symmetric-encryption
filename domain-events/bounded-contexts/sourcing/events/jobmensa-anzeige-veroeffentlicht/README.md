## Jobmensa-Anzeige veroeffentlicht

## Bounded Kontext

## Feldname

`veroeffentlicht_jobmensa_anzeige`

## Felder von veroeffentlicht_jobmensa_anzeige

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| @id | URI | Pflicht | Die URI der Jobmensa-Anzeige |
| titel | String | Pflicht | Der Titel der Jobmesa-Anzeige |
| url | String | Pflicht | Die öffentliche URL der Jobmesa-Anzeige |
| stellenbeschreibung | String | Pflicht  | Die detailierte Stellenbeschreibung |
| auftrag | URI | Pflicht | Der zugehörige Auftrag |
| taetigkeit | URI | Pflicht | Das Taetigkeitsprofil. |
| veroeffentlicht_am | ISO8601 Uhrzeit | Pflicht | Das Veröffentlichungsdatum der Jobmensa-Anzeige. |
| laeuft_ab_am | ISO8601 Uhrzeit | Pflicht | Das Datum an dem die Anzeige auf Jobmensa automatisch beendet wird. |
| stundenlohn_in_cent | Integer | Optional | Der ausgeschriebene Stundenlohn in Euro-Cent. |
| einsatzort | Adresse | Optional | Der Ort dem die Anzeige zugeordnet wird. |
| voraussetzungen | [UUID] | Optional | Liste von UUIDs der Benötigten Voraussetzungen. |
| standort | URI | Optional | Der zugehörige jobvalley Standort. |
| studitemps_ansprechpartner | URI | Optional | Der verantwortliche jobvalley Ansprechpartner. |

## Felder von einsatzort

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| strasse | String | Pflicht  | Strasse |
| hausnummer | String | Pflicht  | Hausnummer |
| plz | String | Pflicht  | PLZ |
| ort | String | Pflicht  | Ort |
| land | String | Optional  | Land |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| sourcing.jobmensa-anzeige-veroeffentlicht | sourcing  |
