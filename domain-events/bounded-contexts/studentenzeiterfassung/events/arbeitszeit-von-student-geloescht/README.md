## Arbeitszeit von Student gelöscht

## Bounded Kontext

Die Studentenzeiterfassung produziert das Event sobald ein Student die erfasste Arbeitszeit löscht.

## Feldname

`loescht_arbeitszeit`

## Felder von loescht_arbeitszeit

| Name | Typ  | Pflichtfeld  | Beschreibung |
|---|---|---|---|
| @id | URI | Pflicht | Global eindeutige Identifikation der Arbeitszeit.|

Es wird grundsätzlich die deutsche Zeitzone angenommen.

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenzeiterfassung.arbeitszeit-von-student-geloescht | studentenzeiterfassung |