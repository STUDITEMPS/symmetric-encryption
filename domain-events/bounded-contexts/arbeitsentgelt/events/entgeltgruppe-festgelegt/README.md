## Entgeltgruppe festgelegt

## Bounded Kontext

_Arbeitsentgelt_ produziert das Event, sobald eine Entgeltgruppe festgelegt wurde. Es ist nicht möglich, eine Entgeltgruppe zu löschen, sie kann aber geändert werden. Bei Änderungen wird erneut dieses Event produziert.

## Feldname

`dokumentiert_entgeltgruppe`

## Felder von `dokumentiert_entgeltgruppe`

| Name | Typ  | Pflichtfeld  | Beschreibung |
|---|---|---|---|
| `entgeltgruppe` | Enum | Pflicht | Entgeltgruppe, die der Tätigkeit des Auftrags entspricht. Mögliche Werte: `"1"`, `"2a"`, `"2b"`, `"3"`, `"4"`, `"5"`, `"6"`, `"7"`, `"8"`, `"9"` |
| `fuer_auftrag` | [URI](https://tools.ietf.org/html/rfc3986) | Pflicht | Auftrag, für den der Stundenlohn festgelegt wurde. |

  ### Beachte die Änderung zum 01.07.2020
  Bis zum 30.07.2020 waren nur die Entgeltgruppen 1-9 zulässig. Ab dem 01.07.2020 wurde die Gruppe 2 durch 2 neue Gruppen ersetzt: 2a und 2b. Entgeltgruppe 2 darf für neue Aufträge nicht mehr ausgewählt werden. Falls für einen Auftrag noch die Entgeltgruppe 2 ausgewählt ist, wird diese mit der Gruppe 2a gleichgesetzt.

## Transport über RabbmitMQ

| Routing Key | Exchange |
|---|---|
| `arbeitsentgelt.entgeltgruppe-festgelegt` | `arbeitsentgelt` |
