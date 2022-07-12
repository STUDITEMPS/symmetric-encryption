## Wochenvertrag Versendet

## Bounded Kontext

## Feldname

`dokumentiert_wochenvertrag_versand`

## Felder von dokumentiert_wochenvertrag_versand

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| @id | URI  | Pflicht  | Global eindeutige Identifikation (UUID) des Arbeitsvertrags. |
| version | Integer | Pflicht  | Version der Arbeitsvertrags |
| vertragsnummer | String | Pflicht  | 	Nummer der Arbeitsvertrags (Steht auf den PDFs zur einfachen Identifikation des Vertrags) inkl. der Versionsnummer. |
| student | URI | Pflicht  | URI der Studenten, der im Vertrag steht |
| download_url | URI | Pflicht  | URL des Vertrags-PDF. |
| versendet_am | ISO 8601 Timestamp | Pflicht  | Gibt den Versandzeitpunkt des Vertrags an. |
| netto_arbeitszeit | Float | Optional | Summe der Netto Arbeitszeiten der Schichten. Nicht vorhanden wenn es keine Schichten gibt. (→ 0) |
| von | ISO 8601 Date | Pflicht | Anfang der Vertragslaufzeit |
| bis | ISO 8601 Date | Pflicht | Ende der Vertragslaufzeit |
| schichten | Liste von Schichten | Optional | Eine Liste von Schicht, mit Daten der Schicht. Kann leer sein wenn aus dem Vertrag alle Schichten storniert wurden. |

## Felder von schichten

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| @id | URI  | Pflicht  | Global eindeutige Identifikation der Schicht. |
| von | ISO 8601 Timestamp | Pflicht  | Startzeitpunkt der Schicht |
| bis | ISO 8601 Timestamp | Pflicht  | Endzeitpunkt der Schicht |
| netto_arbeitszeit_in_stunden | Decimal | Pflicht  | Anzahl der Stunden, die in der Schicht gearbeitet werden |
| stundenlohn | Liste von Stundenlöhnen | Pflicht  | Stundenlohn für die Schicht in Cents |
| auftrag | URI | Pflicht  | Global eindeutige Identifikation des zugehörigen Auftrags. |

## Felder von stundenlohn

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| hoehe_in_cent | Int	  | Pflicht  | Höhe des Stundenlohn in Cent. |
| fuer_auftrag | URI | Pflicht | Der zugehörige Auftrag. |
| gueltig_ab | ISO 8601 Date | Pflicht  | Start-Gültigkeitsdatum des Stundenlohns. |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenanstellung.wochenvertrag-versendet | studentenanstellung  |