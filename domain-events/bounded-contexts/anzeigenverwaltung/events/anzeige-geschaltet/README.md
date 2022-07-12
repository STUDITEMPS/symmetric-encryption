# Anzeige geschaltet

## Bounded Kontext

Die Anzeigenverwaltung produziert das Event sobald ein Staffing Mitarbeiter die Anzeige schaltet.

## Feldname

`schaltet-anzeige`

## Felder von `schaltet-anzeige`

| Name | Typ | Pflichtfeld | Beschreibung |
|---|---|---|---|
| @id | URI | Pflicht | Die URI der Anzeige in der Anzeigenverwaltung |
| fuer_auftrag | URI | Pflicht | Auftrag, für den die Anzeige geschaltet wurde |
| titel | String | Pflicht | Titel der Anzeige |
| einleitung | String | Pflicht | Einleitungssätze der Anzeige |
| jobteaser | String | Pflicht | Teaser-Text der Anzeige |
| aufgaben | Object | Pflicht | Die Aufgaben der Stelle als Stichpunkte |
| profil | Object | Pflicht | Das Kandidatenprofil der Stelle als Stichpunkte |
| eckdaten | Object | Pflicht | Die Eckdaten zur Stelle als Stichpunkte |
| schlusssatz | String | Pflicht | Der Schlusssatz der Stellenanzeige |
| stundenlohn_in_cent| Integer | Pflicht | Derzeitiger Stundenlohn in Euro-Cent |
| laeuft_bis| ISO 8601 Timestamp | Pflicht | Datum und Uhrzeit bis wann die Anzeige online sein soll. |
| einsatzort | Adresse | Pflicht | Detailierte Angabe der Adresse |
| ansprechpartner | Object | Pflicht | Ansprechpartner bei jobvalley (z.B. für Einsatzmail) |
| standort | Object | Pflicht | Verantwortlicher jobvalley Standort |
| sprachanforderungen | Array | Pflicht | Liste an erforderlichen Sprachkenntnissen |
| wochenstunden | ISO8601 Duration | Pflicht | Wochenstunden, die ein Student arbeiten sollte. |

### Felder von `taetigkeitsprofil`

| Name | Typ | Pflichtfeld | Beschreibung |
|---|---|---|---|
| @id | URI | Pflicht | Eindeutige URI der Tätigkeit |
| name | String | Pflicht | Offizieller Daisy-Name der Tätigkeit |

### Felder von `einsatzort`

| Name | Typ | Pflichtfeld | Beschreibung |
|---|---|---|---|
| strasse | String | Pflicht | Straßenname |
| hausnummer | String | Pflicht | Hausnummer |
| plz | String | Pflicht | Postleitzahl |
| ort | String | Pflicht | Ort |
| land | String | Optional | Land |
| bundesland | String | Optional | Bundesland |
| latitude | Float | Optional | Geographische Breite der Adresse |
| longitude | Float | Optional | Geographische Länge der Adresse |

### Felder von `ansprechpartner`

| Name | Typ | Pflichtfeld | Beschreibung |
|---|---|---|---|
| @id | URI | Pflicht | Die URI des jobvalley Mitarbeiters (Ansprechpartner) |
| vorname | String | Pflicht | Vorname des Ansprechpartners |
| nachname | String | Pflicht | Nachname des Ansprechpartners |
| email | String | Pflicht | E-Mail-Adresse des Ansprechpartners |
| google_id | String | Pflicht | Eindeutige ID des verknüpften Google-Kontos |

### Felder von `standort`

| Name | Typ | Pflichtfeld | Beschreibung |
|---|---|---|---|
| @id | URI | Pflicht | Eindeutige URI des Standortes |
| strasse | String | Pflicht | Straße und Hausnummer |
| plz | String | Pflicht | Postleitzahl |
| ort | String | Pflicht | Ort |

### Felder von `sprachanforderungen`

| Name    | Typ | Pflichtfeld | Beschreibung                |
| ------- | --- | ----------- | --------------------------- |
| sprache | URI | Pflicht     | URI (ISO639-1) der Sprache. |
| niveau  | URI | Pflicht     | URI des Niveaus.            |

#### Definitionen von `niveau`

-   `tech.studitemps:sprachen:niveau:anfaenger`
-   `tech.studitemps:sprachen:niveau:fortgeschritten`
-   `tech.studitemps:sprachen:niveau:fliessend`
-   `tech.studitemps:sprachen:niveau:muttersprache`

### Inhalt von `wochenstunden`

Hierbei handelt es sich um die Wochenstunden als Zahl oder Zeitspanne. Beispiele:

- `PT12H` 12 Stunden
- `PT16H/PT20H` 16 - 20 Stunden
- `PT12H30M` 12,5 Stunden

## Transport über RabbmitMQ

| Routing Key | Exchange |
|---|---|
| anzeigenverwaltung.anzeige-geschaltet | anzeigenverwaltung |
