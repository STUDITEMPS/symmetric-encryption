# Profilbild hinterlegt

Das Event wird von der Studentendatenverwaltung produziert, wenn die Studierende ein Profilbild hinterlegt hat. Dies kann in der jobvalley App getan werden. Das Event wird sowohl beim initialen Hinterlegen als auch bei Änderungen geworfen.

Eine Referenz auf das Profilbild ist nicht in der Payload dieses Events enthalten. Das Profilbild kann über imgix (https://imgix.com/) abgerufen werden. Die Url kann wie folgt aus der UUID des Studenten zusammengesetzt werden:
`https://jobvalley-profile-pictures-{env*}.imgix.net/{UUID}` (\*env = `staging` oder `production`).
Um unerlaubten Zugriff auf die Bilder zu verhindern muss zudem die URL mittels eines Tokens signiert werden (https://docs.imgix.com/setup/securing-images).

Da sich die Imgix-URL bei Upload eines neuen Bildes nicht ändert, ist die Upload-Quelle (aktuell App-Backend) dafür verantwortlich den Imgix-Cache zurückzusetzen.

Imgix Libraries: https://docs.imgix.com/libraries

## Felder von `hinterlegt_profilbild`

| Name            | Typ     | Pflichtfeld | Beschreibung                                    |
| --------------- | ------- | ----------- | ----------------------------------------------- |
| student         | URI     | Pflicht     | Global eindeutige Identifikation des Studenten. |


## Transport über RabbitMQ

| Routing Key                              | Exchange            |
| ---------------------------------------- | ------------------- |
| studentenstammdaten.profilbild-hinterlegt| studentenstammdaten |