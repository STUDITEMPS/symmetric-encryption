## Jobmensa-Anzeige geschaltet

## Bounded Kontext

## Feldname

`schaltet_jobmensa_anzeige`

## Felder von schaltet_jobmensa_anzeige

| Name                  | Typ              | Pflichtfeld | Beschreibung                                                                                                                   |
| --------------------- | ---------------- | ----------- | ------------------------------------------------------------------------------------------------------------------------------ |
| @id                   | URI              | Pflicht     | Die URI der zu schaltenden Jobmensa-Anzeige                                                                                    |
| titel                 | String           | Pflicht     | Titel der Anzeige                                                                                                              |
| taetigkeitsbereich    | URI              | Pflicht     | Die URI des Taetigkeitsbereichs, in dem der Job stattfindet. Nicht gleichbedeutend mit den alten Jobmensa-Taetigkeitsprofilen. |
| anforderungen         | Anforderungen    | Optional    | Die Anforderungen, welche von den Bewerbern erfüllt werden müssen.                                                             |
| jobbeschreibung       | String           | Pflicht     | Die Beschreibung des Jobs als Fliesstext.                                                                                      |
| einsatzzeiten         | Einsatzzeit      | Pflicht     | Die zeitlichen Rahmenbedingungen des Einsatzer                                                                                 |
| stellenanzahl         | Integer          | Pflicht     | Anzahl der Stellen, die besetzt werden sollen.                                                                                 |
| minimum_wochenstunden | ISO8601 Duration | Pflicht     | Anzahl der Wochenstunden, die mindestens gearbeitet werden soll.                                                               |
| maximum_wochenstunden | ISO8601 Duration | Pflicht     | Anzahl der Wochenstunden, die maximal gearbeitet werden soll.                                                                  |
| stundenlohn           | Integer          | Pflicht     | Stundenlohn in Cent                                                                                                            |
| einsatzort            | Adresse          | Pflicht     | Die genaue Adresse des Einsatzortes.                                                                                           |
| bewerbungsziel        | String           | Pflicht     | Die URL oder die Email-Adresse, an die Bewerbungen gerichtet werden.                                                           |
| typ_bewerbungsziel    | String           | Pflicht     | Die Art der Bewerbung, ob via E-Mail ("mail") oder über einen Link ("url").                                                    |

## Felder von anforderungen (wenn angegeben)
| Name           | Typ     | Pflichtfeld | Beschreibung                                                              |
| -------------- | ------- | ----------- | ------------------------------------------------------------------------- |
| anforderung    | URI     | Pflicht     | URI der Jobanforderung                                                    |
| wird_benoetigt | Boolean | Pflicht     | Gibt an, ob die Anforderung für den Job benötigt oder nicht benötigt ist. |

## Felder von einsatzort
| Name       | Typ    | Pflichtfeld | Beschreibung |
| ---------- | ------ | ----------- | ------------ |
| strasse    | String | Pflicht     | Strasse      |
| hausnummer | String | Optional    | Hausnummer   |
| plz        | String | Pflicht     | PLZ          |
| ort        | String | Pflicht     | Ort          |
| latitude   | Float  | Pflicht     | Breitengrad  |
| longitude  | Float  | Pflicht     | Längengrad   |

## Felder von Einsatzzeiten
| Name                        | Typ           | Pflichtfeld | Beschreibung                                                                                                             |
| --------------------------- | ------------- | ----------- | ------------------------------------------------------------------------------------------------------------------------ |
| einsatzstart                | ISO8601 Datum | Optional    | Der Beginn des ausgeschriebenen Einsatzes                                                                                |
| einsatz_startet_sofort      | Boolean       | Pflicht     | Angabe, ob der Einsatz "ab sofort" startet. Entweder diese Angabe oder das Einsatzstart-Datum müssen gesetzt sein.       |
| einsatzende                 | ISO8601 Datum | Optional    | Das Enddatum des ausgeschriebenen Einsatzes.                                                                             |
| einsatzende_ist_unbefristet | Boolean       | Pflicht     | Angabe, ob der Einsatz unbefristet ist oder nicht. Entweder diese Angabe oder das Einsatzende-Datum müssen gesetzt sein. |

## Transport über RabbmitMQ

| Routing Key                                | Exchange |
| ------------------------------------------ | -------- |
| anzeigenkunden.jobmensa-anzeige-geschaltet | jobmensa |
