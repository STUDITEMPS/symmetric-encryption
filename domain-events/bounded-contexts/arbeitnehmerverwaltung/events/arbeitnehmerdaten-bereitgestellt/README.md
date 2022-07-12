# Arbeitnehmerdaten bereitgestellt

__Typ__: Reply Event

Der Bounded Kontext _Arbeitnehmerverwaltung_ beherbergt personenbezogene Daten aller Arbeitnehmer, auch solcher die ihren Account in der Studentenverwaltung gelöscht haben und somit von dort nicht mehr abgerufen werden können.

Dieses Event ist somit kein Domain Event im engeren Sinne. Es ist eine Antwort auf das Request-Event _Arbeitnehmerdaten benötigt_ (Beispiel: [rechnungsstellung/events/arbeitnehmerdaten-benötigt](../../../rechnungsstellung/events/arbeitnehmerdaten-benötigt/README.md)) von anderen Kontexten, die Arbeitnehmerdaten benötigen. Zur Zeit sind dies Rechnungsstellung und Arbeitsentgelt.

Es empfiehlt sich ausdrücklich diese Events nicht im Event Store abzulegen, um die Einhaltung der DSGVO zu vereinfachen.

## Felder

* `arbeitnehmerdaten`
* `reply`


### Felder von `arbeitnehmerdaten`

|      Name      |  Typ   | Pflichtfeld |           Beschreibung           |
| -------------- | ------ | ----------- | -------------------------------- |
| `vorname`        | String | Pflicht     | Vorname des Arbeitnehmers        |
| `nachname`       | String | Pflicht     | Nachname des Arbeitnehmers       |
| `personalnummer` | String | Pflicht     | Personalnummer des Arbeitnehmers |

Falls für den per ID angefragten Arbeitnehmer keine Daten vorliegen, sind die obigen Felder mit `null` befüllt. Das könnte man ggfs. in der nächsten Version dieses Events expliziter machen.

### Felder von `reply`

Komplette Spiegelung des `reply` Feldes vom Request Event

## Transport über RabbmitMQ

|                   Routing Key                    |                   Exchange                   |
| ------------------------------------------------ | -------------------------------------------- |
| Inhalt von `reply.routing_key` vom Request Event | Inhalt von `reply.exchange` vom Request Event |
