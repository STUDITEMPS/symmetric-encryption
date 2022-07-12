## Einsatz zur Besetzung freigegeben

## Bounded Kontext

Der Kontext Personalbestellung publiziert das Event, wenn ein bestellter Einsatz vertraglich abgedeckt und im Zuge dessen zur Besetzung freigegeben wurde.

## Feldname

`gibt_einsatz_zur_besetzung_frei`

## Felder von gibt_einsatz_zur_besetzung_frei

| Name | Typ | Pflichtfeld | Beschreibung |
|---|---|---|---|
| @id | URI | Pflicht | URI des Einsatzes |
| kunde | URI | Pflicht | Kunde, für den die Bestellung aufgegeben wurde |
| filiale | URI | Pflicht | Filiale, für die die Bestellung aufgegeben wurde |
| bestellung | URI | Pflicht | URI der Bestellung |
| bestellt_von_kundenmitarbeiter | URI | Pflicht | Kundenmitarbeiter, der die Bestellung aufgegeben hat |
| freigegeben_um | ISO8601 Uhrzeit | Pflicht | Uhrzeit, zu der der Einsatz zur Besetzung freigegeben wurde |
| einsatzort | Object | Pflicht | Adresse, an der der Einsatz stattfindet |
| taetigkeit | Object | Pflicht | Tätigkeit des Einsatzes |
| einsatzzeit | Object | Pflicht | Arbeitszeitraum und Pausenzeit des Einsatzes |
| anzahl_studenten | Integer | Pflicht | Anzahl der bestellten Studenten |
| verrechnungssatz_in_cent | Integer | Pflicht | Verrechnungssatz in Euro-Cent |
| stundenlohn_in_cent | Integer | Pflicht | Stundenlohn in Euro-Cent |

## Felder von einsatzort

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| strasse | String | Pflicht  | Strasse |
| hausnummer | String | Optional | Hausnummer |
| plz | String | Pflicht  | PLZ |
| stadt | String | Pflicht  | Ort |
| bundesland | String | Pflicht  | Ort |

### mögliche Bundesländer
- `Baden-Württemberg`
- `Bayern`
- `Berlin`
- `Brandenburg`
- `Bremen`
- `Hamburg`
- `Hessen`
- `Mecklenburg-Vorpommern`
- `Niedersachsen`
- `Nordrhein-Westfalen`
- `Rheinland-Pfalz`
- `Sachsen`
- `Sachsen-Anhalt`
- `Saarland`
- `Schleswig-Holstein`
- `Thüringen`
- 
## Felder von taetigkeit

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| taetigkeitsprofil | URI | Pflicht | URI des Tätigkeitsprofils |
| individueller_name | String | Pflicht | freie Bezeichnung der Tätigkeit |

## Felder von einsatzzeit

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| zeitraum | ISO8601 Interval | Pflicht | Zeitraum des Einsatzes |
| netto_arbeitszeit | ISO8601 Duration | Pflicht | Nettoarbeitszeit ohne Pause |
| pause | ISO8601 Duration | Optional | Pausendauer |

## Transport über RabbmitMQ

| Routing Key                                          | Exchange          |
| -----------------------------------------------------| ----------------- |
| personalbestellung.einsatz-zur-besetzung-freigegeben | personalbestellung |