# Student abgesagt

Das Event "Student abgesagt" wird produziert, sobald der Studentin in der Qualifizierung abgesagt wird.

## `sagt_student_ab`

| Name    | Type | Pflichtfeld | Beschreibung                                       |
| ------- | ---- | ----------- | -------------------------------------------------- |
| student | URI  | Pflicht     | Die Studentin, der im Auftrag abgesagt wurde.  |
| auftrag | URI  | Pflicht     | Auftrag, für den der Studentin abgesagt wurde. |
| grund   | URI  | Pflicht     | Grund der Absage.                                  |

## Gründe

Aktuelle Liste der Gründe. Wir haben vor, unbenutzte Gründe zu entfernen und ggf. neue Gründe einzuführen. Auch ist geplant, ggf. die Gründe zu gruppieren. Die Liste ist also als relativ dynamisch anzusehen. Da CSMs die Gründe auswählen, ist auch hier davon auszugehen, dass die Gründe subjektiv sind.

-   `tech.studitemps:qualifizierung:absage-grund:sprachkenntnisse`
-   `tech.studitemps:qualifizierung:absage-grund:wegstrecke`
-   `tech.studitemps:qualifizierung:absage-grund:anforderungsprofil`
-   `tech.studitemps:qualifizierung:absage-grund:erreichbarkeit`
-   `tech.studitemps:qualifizierung:absage-grund:verfuegbarkeit`
-   `tech.studitemps:qualifizierung:absage-grund:absage-kunde`
-   `tech.studitemps:qualifizierung:absage-grund:absage-student`
-   `tech.studitemps:qualifizierung:absage-grund:voll-rekrutiert`
-   `tech.studitemps:qualifizierung:absage-grund:absolvent`
-   `tech.studitemps:qualifizierung:absage-grund:nicht-student`
-   `tech.studitemps:qualifizierung:absage-grund:unzuverlaessig`
-   `tech.studitemps:qualifizierung:absage-grund:auftrag-abgesagt`
-   `tech.studitemps:qualifizierung:absage-grund:daten-unvollstaendig`
-   `tech.studitemps:qualifizierung:absage-grund:qualifiziert-in-anderem-auftrag`
-   `tech.studitemps:qualifizierung:absage-grund:sonstiges`
-   `tech.studitemps:qualifizierung:absage-grund:nicht-studitemps-geeignet` (kann nicht von CSMs ausgewählt werden, sondern wird ausgelöst, wenn ein Student, der für jobvalley nicht geeignet ist, sich auf einen Auftrag beworben hat)

### Nicht mehr verwendete Gründe
-   `tech.studitemps:qualifizierung:absage-grund:automatische-absage` (wurde automatisch ausgelöst, wenn eine Bewerbung zu lange ungelesen war, diese automatische Absage gibt es nicht mehr)

## Transport über RabbmitMQ

| Routing Key                     | Exchange       |
| ------------------------------- | -------------- |
| qualifizierung.student-abgesagt | qualifizierung |
