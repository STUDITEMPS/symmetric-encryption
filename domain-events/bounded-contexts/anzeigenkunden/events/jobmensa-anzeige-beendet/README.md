## Jobmensa-Anzeige beendet

### Mögliche Ursachen für die Beendigung einer Anzeige
1. "abgelaufen"
2. "manuell_beendet"
3. "geloescht"
4. "blacklist"

## Bounded Kontext

## Feldname

`beendet_jobmensa_anzeige`

## Felder von beendet_jobmensa_anzeige

| Name | Typ | Pflichtfeld | Beschreibung |
|---|---|---|---|
| @id | URI | Pflicht | Die URI der Jobmensa-Anzeige |
| ursache | URI | Pflicht | Die Ursache der Beendigung |

# Ursachen

| Label | URI  | Beschreibung  |
|---|---|---|
| abgelaufen | 'tech.studitemps:anzeigenkunden:jobmensa-anzeigen-ende:abgelaufen' | Die Anzeige wurde automatisch aufgrund der Laufzeit beendet |
| manuell-beendet | 'tech.studitemps:anzeigenkunden:jobmensa-anzeigen-ende:manuell-beendet' | Die Anzeige wurde durch einen Customer Success Manager oder Admin beendet |
| geloescht | 'tech.studitemps:anzeigenkunden:jobmensa-anzeigen-ende:geloescht' | Die Anzeige wurde durch einen Admin geloescht |
| blacklist | 'tech.studitemps:anzeigenkunden:jobmensa-anzeigen-ende:blacklist' | Das Unternehmen, welches die Anzeige geschaltet hat, wurde von einem Admin auf die Blacklist gesetzt |

## Transport über RabbmitMQ

| Routing Key | Exchange |
|---|---|
| anzeigenkunden.jobmensa-anzeige-beendet | jobmensa |
