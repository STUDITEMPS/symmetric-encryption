## Self-Service-AÜV beidseitig gezeichnet

## Bounded Kontext

Der Kontext Vertragsverwaltung wirft dieses Event, wenn ein Self-Service-AÜV vom Kundenmitarbeiter und vom jobvalley Mitarbeiter elektronisch signiert wurde.

## Feldname

`zeichnet_self_service_auev_beidseitig`

## Felder von zeichnet_self_service_auev_beidseitig

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| @id | URI | Pflicht  | Global eindeutige Identifikation der Self-Service-AÜV. |
| vertragsnummer | String | Pflicht  | Die Vertragsnummer der Self-Service-AÜV. |
| kunde | URI | Pflicht  | Global eindeutige Identifikation des Kunden. |
| filiale | URI | Pflicht  | Global eindeutige Identifikation der Filiale. |
| fuer_bestellung | URI | Pflicht  | Global eindeutige Identifikation der Bestellung. |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| vertragsverwaltung.self-service-auev-beidseitig-gezeichnet | vertragsverwaltung |
