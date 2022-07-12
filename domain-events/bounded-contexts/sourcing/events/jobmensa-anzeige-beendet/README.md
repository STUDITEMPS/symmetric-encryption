## Jobmensa-Anzeige beendet

### Mögliche Ursachen für die Beendigung einer Anzeige
1. "laufzeit_abgelaufen"
2. "manuell_beendet"

## Bounded Kontext

## Feldname

`beendet_jobmensa_anzeige`

## Felder von beendet_jobmensa_anzeige

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| @id | URI | Pflicht  | Die URI der Jobmensa-Anzeige |
| ursache | URI | Pflicht  | Die Ursache der Beendigung |

# Ursachen

| Label | URI  | Beschreibung  |
|---|---|---|
| laufzeit-abgelaufen | 'tech.studitemps:sourcing:jobmensa-anzeigen-ende:laufzeit-abgelaufen' | Die Anzeige wurde automatisch aufgrund der Laufzeit beendet |
| manuell-beendet | 'tech.studitemps:sourcing:jobmensa-anzeigen-ende:manuell-beendet' | Die Anzeige wurde durch einen Customer Success Manager beendet |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| sourcing.jobmensa-anzeige-beendet | sourcing  |
