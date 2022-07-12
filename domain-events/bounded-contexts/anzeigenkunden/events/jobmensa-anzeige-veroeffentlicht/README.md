## Jobmensa-Anzeige veröffentlicht

## Bounded Kontext
Jobmensa produziert das Event, sobald eine Anzeige von einem Unternehmen geschaltet wurde.

## Feldname

`veroeffentlicht_jobmensa_anzeige`

## Felder von veroeffentlicht_jobmensa_anzeige

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| @id | URI | Pflicht | Die URI der Jobmensa-Anzeige |
| titel | String | Pflicht | Der Titel der Jobmesa-Anzeige |
| url | String | Pflicht | Die öffentliche URL der Jobmesa-Anzeige |
| stellenbeschreibung | String | Pflicht  | Die detailierte Stellenbeschreibung |
| veroeffentlicht_am | ISO8601 Uhrzeit | Pflicht | Das Veröffentlichungsdatum der Jobmensa-Anzeige. |
| laeuft_ab_am | ISO8601 Uhrzeit | Pflicht | Das Datum an dem die Anzeige auf Jobmensa automatisch beendet wird. |
| stundenlohn_in_cent | Integer | Optional | Der ausgeschriebene Stundenlohn in Euro-Cent. |
| einsatzorte | Array<> | Optional | Der Ort dem die Anzeige zugeordnet wird. |

## Felder von einsatzort

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| plz | String | Pflicht  | PLZ |
| stadt | String | Pflicht  | Ort |
| land | String | Optional  | Land |
| latitude | Float | Pflicht  | Breitengrad |
| longitude | Float | Pflicht  | Längengrad |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| anzeigenkunden.jobmensa-anzeige-veroeffentlicht | jobmensa  |
