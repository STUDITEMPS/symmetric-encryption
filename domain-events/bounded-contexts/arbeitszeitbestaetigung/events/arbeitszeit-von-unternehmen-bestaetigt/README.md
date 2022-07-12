# Arbeitszeit von Unternehmen bestätigt

## Bounded Kontext

Der Kontext produziert das Event sobald das Unternehmen die geleistete Arbeitszeit des Arbeitnehmers bestätigt.


## Feldname

`bestaetigt_arbeitszeit`

## Felder von bestaetigt_arbeitszeit

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| `@id`  | [URI](https://tools.ietf.org/html/rfc3986)  | Pflicht  | Global eindeutige Identifikation der Arbeitszeit. |


## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| `arbeitszeitbestaetigung.arbeitszeit-von-unternehmen-bestaetigt` | `arbeitszeitbestaetigung`  |
