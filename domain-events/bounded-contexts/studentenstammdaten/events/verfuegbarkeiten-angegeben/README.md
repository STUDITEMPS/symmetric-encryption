## Verfügbarkeiten angegeben

## Bounded Kontext

Das Event "Verfügbarkeiten angegeben" wird produziert, sobald ein Student seine Verfügbarkeiten in der App angegeben hat.

Das Event kann mehrfach mit den gleichen Angaben geworfen werden, wenn ein Student seine Verfügbarkeiten erneut bestätigt, ohne sie geändert zu haben. Die wichtige Information in dem letzten Event ist dann der Zeitpunkt der Aktualisierung.

## Feldname

`gibt_verfuegbarkeiten_an`

## Felder von gibt_verfuegbarkeiten_an

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| student | URI | Pflicht  | Global eindeutige Identifikation des Studenten |
| verfuegbarkeiten | Object | Pflicht  | Liste aller Wochentage mit der angegebenen Verfübarkeit |

## Felder von verfuegbarkeiten

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| montag | Liste von Uhrzeit-Intervallen | Pflicht  | Liste der Verfügbarkeiten zum Wochentag |
| dienstag | Liste von Uhrzeit-Intervallen | Pflicht  | Liste der Verfügbarkeiten zum Wochentag |
| mittwoch | Liste von Uhrzeit-Intervallen | Pflicht  | Liste der Verfügbarkeiten zum Wochentag |
| donnerstag | Liste von Uhrzeit-Intervallen | Pflicht  | Liste der Verfügbarkeiten zum Wochentag |
| freitag | Liste von Uhrzeit-Intervallen | Pflicht  | Liste der Verfügbarkeiten zum Wochentag |
| samstag | Liste von Uhrzeit-Intervallen | Pflicht  | Liste der Verfügbarkeiten zum Wochentag |
| sonntag | Liste von Uhrzeit-Intervallen | Pflicht  | Liste der Verfügbarkeiten zum Wochentag |

## Aufbau einer Liste von Verfügbarkeiten

Liste kann 0 – n Uhrzeit-Intervalle in der Form `Thh:mm/Thh:mm` enthalten.
Das Ende eines Tages wird als 24:00 übermittelt.


## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenstammdaten.verfuegbarkeiten-angegeben | studentenverwaltung  |
