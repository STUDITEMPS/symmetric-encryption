## Self-Service-AÜV für elektronische Signatur freigegeben

## Bounded Kontext

Der Kontext Vertragsverwaltung wirft dieses Event, wenn ein Self-Service-AÜV für die elektronische Signatur freigegeben wurde. Der Kundenmitarbeiter muss zuerst den Self-Service-AÜV signieren.

## Feldname

`gibt_self_service_auev_fuer_elektronische_signatur_frei`

## Felder von gibt_self_service_auev_fuer_elektronische_signatur_frei

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
| vertragsverwaltung.self-service-auev-fuer-elektronische-signatur-freigegeben | vertragsverwaltung |
