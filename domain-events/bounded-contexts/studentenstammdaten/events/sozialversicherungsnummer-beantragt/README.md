# Sozialversicherungsnummer beantragt

Das Event wird publiziert, wenn der Student ein Sozialversicherung durch jobvalley beantragen lassen möchte. Dazu gibt er alle dazu notwendigen Daten an. Dies kann er in der jobvalley App tun.

## Felder von `beantragt_sozialversicherungsnummer`

| Name           | Typ                | Pflichtfeld | Beschreibung                                    |
| -------------- | ------------------ | ----------- | ----------------------------------------------- |
| student        | URI                | Pflicht     | Global eindeutige Identifikation des Studenten. |
| geburtsort     | String (Encrypted) | Pflicht     | Der Geburtsort des Studenten.                   |
| geburtsland    | String (Encrypted) | Pflicht     | Das Geburtsland des Studenten.                  |
| geburtsname    | String (Encrypted) | Pflicht     | Der Geburtsname des Studenten.                  |
| geschlecht     | String (Encrypted) | Pflicht     | Das Geschlecht des Studenten.                   |

### Mögliche Werte für Geschlecht (Decrypted)

- `männlich`
- `weiblich`
- `divers`

## Transport über RabbitMQ

| Routing Key                                             | Exchange            |
| ------------------------------------------------------- | ------------------- |
| studentenstammdaten.sozialversicherungsnummer-beantragt | studentenstammdaten |
