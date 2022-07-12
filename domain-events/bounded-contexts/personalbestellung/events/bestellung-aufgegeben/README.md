## Bestellung aufgegeben

## Bounded Kontext

Der Kontext Personalbestellung publiziert das Event, wenn vom Kunden eine Bestellung aufgegeben wurde.

## Feldname

`gibt_bestellung_auf`

## Felder von gibt_bestellung_auf

| Name | Typ | Pflichtfeld | Beschreibung |
|---|---|---|---|
| @id | URI | Pflicht | URI der Bestellung |
| kunde | URI | Pflicht | Kunde, für den die Bestellung aufgegeben wurde |
| filiale | URI | Pflicht | Filiale, für die die Bestellung aufgegeben wurde |
| von_kundenmitarbeiter | URI | Pflicht | Kundenmitarbeiter, der die Bestellung aufgegeben hat |
| aufgegeben_am | URI | Pflicht | Kundenmitarbeiter, der die Bestellung aufgegeben hat |
| einsaetze | [Einsatz] | Pflicht | Liste der Einsätze, die bestellt wurden. |


## Felder von einsatz

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| @id | URI | Pflicht | URI des Einsatzes |
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
| individueller_name | String | Pflicht | Bezeichnung der Tätigkeit |
| taetigkeitsprofil | URI | Pflicht | URI des Tätigkeitsprofils |

## Felder von einsatzzeit

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| zeitraum | ISO8601 Interval | Pflicht | Zeitraum des Einsatzes |
| netto_arbeitszeit | ISO8601 Duration | Pflicht | Nettoarbeitszeit ohne Pause |
| pause | ISO8601 Duration | Optional | Pausendauer |

## Transport über RabbmitMQ

| Routing Key                                          | Exchange          |
| -----------------------------------------------------| ----------------- |
| personalbestellung.bestellung-aufgegeben | personalbestellung |
