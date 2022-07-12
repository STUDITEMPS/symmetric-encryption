## Arbeitnehmer abgerechnet

## Bounded Kontext

_Arbeitsentgelt_ produziert das Event _ArbeitnehmerAbgerechnet_, sobald ein Arbeitnehmer im Kontext des _Arbeitsentgelts_ abgerechnet wurde. Abgerechnet in diesem Kontext bedeutet, dass alle _Lohnzeilen_ (= _Bewegungsdaten_) erstellt wurden.

## Feldname

`dokumentiert_abrechnung`

## Felder von `dokumentiert_abrechnung`

| Name | Typ  | Pflichtfeld  | Beschreibung |
|---|---|---|---|
| `fuer_arbeitnehmer` | URI | Pflicht | Global eindeutige Identifikation des abgerechneten Arbeitnehmers |
| `fuer_abrechnungsmonat` | ISO8601 Monat | Pflicht | Monat, für den gerade abgerechnet wird. In der Regel der vorhergehende Kalendermonat. Unabhängig davon können auch Arbeitszeiten aus Vormonaten abgerechnet werden. Dann handelt es um eine Nachberechnung. |
| `lohnzeilen` | List | Pflicht | alle Lohnzeilen, die zu dieser Abrechnung gehören |

## Felder der `lohnzeilen`

| Name | Typ  | Pflichtfeld  | Beschreibung |
|---|---|---|---|
| `@type`	 | [URI](https://tools.ietf.org/html/rfc3986) | Pflicht | Typ (`tech.studitemps:arbeitsentgelt:lohnzeile`) |
| `datum` | [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) | Pflicht | Datum der Arbeitsaufnahme der Arbeitszeit, die mit dieser Lohnzeile abgerechnet wird |
| `lohnart` | [URI](https://tools.ietf.org/html/rfc3986) | Pflicht | Lohnart der Lohnzeile (Arbeitslohn oder diverse Zuschläge, siehe hier) |
| `menge` | Float | Pflicht | Anzahl der Stunden, für die diese Lohnzeile erstellt wird |
| `preis_in_cent` | Integer | Pflicht | Stundenlohn/Zuschlag (Multiplikator für menge, um an tatsächlich auszuzahlenden Lohn zu kommen) |

## Mögliche Lohnarten

* `tech.studitemps:arbeitsentgelt:lohnart:arbeitslohn`
* `tech.studitemps:arbeitsentgelt:lohnart:sonntagszuschlag`
* `tech.studitemps:arbeitsentgelt:lohnart:feiertagszuschlag`
* `tech.studitemps:arbeitsentgelt:lohnart:mehrarbeitszuschlag`
* `tech.studitemps:arbeitsentgelt:lohnart:nachtzuschlag`

## Arbeitszeiten

Die Arbeitszeiten werden als Teil der unreliable_debugging_data serialisiert, da sie nicht direkt zu der Abrechnung eines Arbeitnehmers gehören, aber es sehr praktisch ist, diese in hierbei huckepack an die _SV-Einordnung_ weiterzureichen. Sobald eine bessere Modellierung (oder ein guter Grund, warum Arbeitszeiten Teil der Abrechnung sind) gefunden wurde, kann das Event angepasst werden. Die Arbeitszeit hier enthält entweder eine (möglicherweise leere) Liste von Pausen als enthielt_pausen oder die Dauer der Pausen als hatte_gesamtpausendauer_in_stunden_von.

## Transport über RabbmitMQ

| Routing Key | Exchange |
|---|---|
| `arbeitsentgelt.arbeitnehmer-abgerechnet` | `arbeitsentgelt` |
