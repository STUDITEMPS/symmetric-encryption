## Auftrag angelegt

## Bounded Kontext

Der Kontext Personalbestellung publiziert das Event, sobald vom Kunden eine Bestellung aufgegeben wurde und alle rechtlichen Vorbedingungen erfüllt wurden.

## Feldname

`legt_auftrag_an`

## Felder von legt_auftrag_an

| Name | Typ | Pflichtfeld | Beschreibung |
|---|---|---|---|
| @id | URI | Pflicht | URI des Auftrags |
| auftragsnummer | Integer | Pflicht | Auftragsnummer, beginnend bei 1 000 000 |
| kunde | Object | Pflicht | Kunde, für den der Auftrag angelegt wurde |
| filiale | URI | Pflicht | URI der Filiale |
| ansprechpartner | Object | Pflicht | Ansprechpartner ist der Kundenmitarbeiter, der die erste Bestellung für den Auftrag getätigt hat. |
| einsatzort | Object | Pflicht | Adresse, an der die Einsätze in diesem Auftrag stattfinden |
| taetigkeit | Object | Pflicht | Tätigkeit des Auftrags |
| sprachanforderungen | Object | Pflicht | Sprachanforderungen des Auftrags und Info, ob alle oder eine gefordert. Im Standard zunächst immer "deutsch" auf Niveau "fließend". |
| entgeltgruppe | String | Pflicht | Entgeltgruppe für Einsätze in diesem Auftrag. Im Standard zunächst nur "EG1". |
| stundenlohn_in_cent | Integer | Pflicht | Stundenlohn für Einsätze in diesem Auftrag in Euro-Cent |
| verrechnungssatz_in_cent | Integer | Pflicht | Verrechnungssatz für Einsätze in diesem Auftrag in Euro-Cent |
| rechnungsturnus | URI | Pflicht | URI des Rechnungsturnus für Rechnungen zu diesem Auftrag. Im Standard immer "wöchentlich". |
| zahlungsziel_in_tagen | Integer | Pflicht | Zahlungsziel für Rechnungen zu diesem Auftrag in Tagen. Im Standard immer 14 Tage. |
| zuschlagssatz | URI | Pflicht | URI des Zuschlagssatzes. Im Standard immer "ohne Zuschläge". |
| zeiterfassungsart | URI | Pflicht | URI der Zeiterfassungsart. Im Standard immer "Studentenzeiterfassung". |
| einbuchen_in_schichten_freigeschaltet | Boolean | Pflicht | Gibt an, ob das Einbuchen in Schichten in diesem Auftrag freigeschaltet ist. Im Standard immer "ja" (true). |
| automatisches_matching_aktiviert | Boolean | Pflicht | Gibt an, ob im Auftrag das automatische Matching aktiviert ist. Im Standard immer "ja" (true). |
| taetigkeitsfelder | [URI] | Optional | Liste an Tätigkeitsfeldern, für die der:die Student:in geeignet sein soll. |


## Felder von kunde

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| @id | URI | Pflicht | URI des Kunden |
| firmierung | String | Pflicht | Firmierung/Unternehmensname des Kunden |
| vertragsadresse | Object | Pflicht | Vertragsadresse des Kunden |
| handelsregisternummer | String | Pflicht | Handelsregisternummer des Kunden |
| amtsgericht | String | Pflicht | Amtsgericht des Kunden |


## Felder von vertragsadresse

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| plz | String | Pflicht  | PLZ |
| stadt | String | Pflicht  | Ort |
| strasse | String | Pflicht  | Strasse |
| hausnummer | String | Optional | Hausnummer |

## Felder von Kundenmitarbeiter

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| id| URI | Pflicht | Global eindeutige Identifikation des Kundenmitarbeiters|
| anrede| String | Pflicht | Anrede |
| vorname| String | Pflicht | Vorname |
| nachname| String | Pflicht | Nachname|
| email| String | Pflicht | E-Mail-Adresse|

## Felder von einsatzort

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| plz | String | Pflicht  | PLZ |
| stadt | String | Pflicht  | Ort |
| strasse | String | Pflicht  | Strasse |
| hausnummer | String | Optional | Hausnummer |
| bundesland | String | Pflicht  | Bundesland |
| land | String | Pflicht  | Land |


## Felder von taetigkeit

| Name | Typ | Pflichtfeld | Beschreibung |
|---|---|---|---|
| taetigkeitsprofil  | URI | Pflicht | URI des Tätigkeitsprofils |
| individueller_name | String | Optional | Freie Angabe zum Namen der Tätigkeit, die z.B. dem Studenten angezeigt wird. |

#### Definitionen von `taetigkeitsprofil`

-   `tech.studitemps:taetigkeiten:verkaufshilfe`
-   `tech.studitemps:taetigkeiten:inventurhilfe`
-   `tech.studitemps:taetigkeiten:produktionshilfe`
-   `tech.studitemps:taetigkeiten:kuechenhilfe`
-   `tech.studitemps:taetigkeiten:bueroassistenz`
-   `tech.studitemps:taetigkeiten:geschenkeverpacker`

### Felder von sprachanforderungen

| Name    | Typ | Pflichtfeld | Beschreibung                |
| ------- | --- | ----------- | --------------------------- |
| sprachen | Array | Pflicht     | Sprachanforderungen des Auftrags. Im Standard zunächst immer "deutsch" auf Niveau "fließend" |
| alle_sprachen_gefordert  | Boolean | Pflicht     | Information, ob aus der Liste der Sprachkenntnisse alle gefordert sind oder nur mindestens eine von diesen.            |
### Felder von sprachkenntnisse

| Name    | Typ | Pflichtfeld | Beschreibung                |
| ------- | --- | ----------- | --------------------------- |
| sprache | URI | Pflicht     | URI (ISO639-1) der Sprache. |
| niveau  | URI | Pflicht     | URI des Niveaus.            |

#### Definitionen von `sprache`

-   `tech.studitemps:sprachen:iso639-1:de`

#### Definitionen von `niveau`

-   `tech.studitemps:sprachen:niveau:fliessend`
-   `tech.studitemps:sprachen:niveau:fortgeschritten`


#### Definitionen von `rechnungsturnus`

-   `tech.studitemps:rechnungsstellung:rechnungsturnus:woechentlich`

#### Definitionen von `zuschlagssatz`

-   `tech.studitemps:rechnungsstellung:zuschlagssatz:ohne-zuschlaege`

#### Definitionen von `zeiterfassungsart`

-   `tech.studitemps.auftragskonfiguration:zeiterfassungsart:studentenzeiterfassung`

### Tätigkeitsfelder URIs

-   `tech.studitemps:taetigkeitsfeld:buerotaetigkeiten`
-   `tech.studitemps:taetigkeitsfeld:kundenkontakt`

## Transport über RabbmitMQ

| Routing Key                                          | Exchange          |
| -----------------------------------------------------| ----------------- |
| personalbestellung.auftrag-angelegt | personalbestellung |
