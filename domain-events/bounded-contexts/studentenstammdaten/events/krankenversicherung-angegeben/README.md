# Krankenversicherung angegeben

Das Event wird publiziert, wenn die Studentin ihre Daten zur Krankenversicherung hinterlegt. Dies kann sie in der jobvalley App tun. Das Event wird sowohl beim initialen Hinterlegen als auch bei Änderungen geworfen.

Die **Versicherungsart** bestimmt den Inhalt von `gesetzliche_versicherung`:

Wenn die Studentin **gesetzlich** versichert ist, hinterlegt sie den Name des Versicherers (`gesetzliche_versicherung`) und muss keine Alternative angeben. Ist die Studentin **privat** versichert, so hinterlegt sie nicht den Namen ihrer privaten Versicherung, sondern eine alternative gesetzliche Versicherung, bei der sie für den Anstellungszeitraum versichert werden möchte, welche dann in `gesetzliche_versicherung` enthalten ist.

## Felder von `gibt_krankenversicherung_an`

| Name                | Typ    | Pflichtfeld | Beschreibung                                    |
| ------------------- | ------ | ----------- | ----------------------------------------------- |
| student             | URI    | Pflicht     | Global eindeutige Identifikation des Studenten. |
| krankenversicherung | Object | Pflicht     | Die Krankenversicherung des Studenten.          |

### Krankenversicherung

| Name                                 | Typ                | Pflichtfeld | Beschreibung                                                |
| ------------------------------------ | ------------------ | ----------- | ----------------------------------------------------------- |
| versicherungsart                     | String (Encrypted) | Pflicht     | Die Art der Versicherung                                    |
| gesetzliche_versicherung             | String (Encrypted) | Optional    | Name der gesetzlichen Versicherung                          |

### Mögliche Versicherungsarten (Decrypted)
- `privat`
- `gesetzlich`

## Transport über RabbitMQ

| Routing Key                                       | Exchange            |
| ------------------------------------------------- | ------------------- |
| studentenstammdaten.krankenversicherung-angegeben | studentenstammdaten |
