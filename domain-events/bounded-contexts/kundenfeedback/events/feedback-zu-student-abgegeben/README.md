## Feedback zu Student abgegeben

## Bounded Kontext

Kontext Kundenfeedback wirft dieses Event, wenn ein Kundenmitarbeiter Feedback zu einem Studenten abgegeben hat.

## Feldname

`kundenmitarbeiter_gibt_feedback_zu_student_ab`

## Felder von kundenmitarbeiter_gibt_feedback_zu_student_ab

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| auftrag| URI | Pflicht | Global eindeutige Identifikation des Auftrags|
| kundenmitarbeiter| URI | Pflicht | Global eindeutige Identifikation des Kundenmitarbeiters|
| student| URI | Pflicht | Global eindeutige Identifikation des Studenten|
| taetigkeit| URI | Pflicht | Global eindeutige Identifikation der Tätigkeit|
| individuelle_taetigkeit| String | Optional | Name der individuellen Tätigkeit|
| studentenbewertung| Integer | Pflicht | Bewertung des Studenten von 1 bis 5: 1 = enttäuschend, 2 = nicht so gut, 3 = okay, 2 = gut, 5 = perfekt|
| begruendungen| Liste| Optional| Liste aus einer Auswahl von Begründungen fuer die Bewertung
| anmerkung| String | Optional | Freitextfeld fuer eine Anmerkung des Kundenmitarbeiters|
| abgegeben_am| ISO8601 | Pflicht | Zeitpunkt des Feedbacks|

## Feld Begründungen

Optional kann der Kunde Begründungen für seine Bewertung angeben.
Derzeit wird er dazu aufgefordert, wenn er den Studenten mit 1, 2 oder 3 bewertet hat.
Die Liste im Feld Begründungen besteht aus URIs.

Beispiel:
```
[
  tech.studitemps:kundenfeedback:feedback-zu-student-abgegeben-begruendung:jobvoraussetzung-nicht-erfuellt,
  tech.studitemps:kundenfeedback:feedback-zu-student-abgegeben-begruendung:unzureichende-qualitaet-der-arbeit
]
```

Die Begründung wählt er aus folgender Liste aus:

| Name | Id |
| --- | --- |
| Jobvoraussetzung nicht erfüllt | `jobvoraussetzung-nicht-erfuellt` |
| Unzureichende Qualität der Arbeit | `unzureichende-qualitaet-der-arbeit` |
| Unangebrachter Umgang mit Kunden | `unangebrachter-umgang-mit-kunden` |
| Unangemessenes Verhalten | `unangemessenes-verhalten` |
| Unpünktlichkeit | `unpuenktlichkeit` |
| Unzureichende Sprachkenntnisse | `unzureichende-sprachkenntnisse` |
| Keine Angabe | `keine-angabe` |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| kundenfeedback.feedback-zu-student-abgegeben | kundenfeedback|
