# Sprachanforderungen festgelegt

Das Event wird vom Kandidatenprofil produziert, wenn die Anforderungen an das Sprachniveau des Kandidaten neu festgelegt wurden.
Die Anforderungen können dabei zum ersten Mal oder erneut festgelegt worden sein.
Die Liste an Anforderungen kann leer sein, wenn die neu festgelegte Anforderung ist, dass der Auftrag keine Sprachanfoderungen mehr hat.

Das Event beschreibt, dass ein Kandidat die Fähigkeit besitzen muss, die angegeben Sprachen auf einem entsprechenden Niveau zu sprechen.
Die Interpretation der unterschiedlichen Niveaus ist subjektiv und nicht genau definiert.

Wenn es keine oder nur eine Sprache gibt, kann das Feld `alle_sprachen_gefordert` ignoriert werden. Es hat nur eine Aussagekraft wenn es mehr als eine Sprache gibt. Bei älteren Events ohne dieses Feld kann man keine Aussage über den Wert des Feldes machen, statistisch gesehen sind aber vermutlich in den meisten Fällen alle Sprachen gefordert.

Später kann ggf. noch ein formelleres Niveau hinzugefügt werden (referenzniveau/globalskala), angelehnt an zum Beispiel die [Globalskala](http://www.europaeischer-referenzrahmen.de/sprachniveau.php).

## Felder von `legt_sprachanforderungen_fest`

| Name                    | Typ     | Pflichtfeld                       | Beschreibung                                                                                                   |
| ----------------------- | ------- | --------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| fuer_auftrag            | URI     | Pflicht                           | Auftrag, für den Anforderungen festgelegt wurden                                                               |
| sprachanforderungen     | Array   | Pflicht                           | Liste an Sprachen, die als Anforderung für den Auftrag gelten. Kann leer sein.                                  |
| alle_sprachen_gefordert | Boolean | Pflicht<sup>[\*](#newField)</sup> | Information, ob aus der Liste der Sprachanforderungen alle gefordert sind oder nur mindestens eine von diesen. |

<a name="newField">\*</a> Es gibt alte Events die dieses Feld nicht besitzen.

## Felder eines Eintrags in `sprachanforderungen`

| Name    | Typ | Pflichtfeld | Beschreibung                |
| ------- | --- | ----------- | --------------------------- |
| sprache | URI | Pflicht     | URI (ISO639-1) der Sprache. |
| niveau  | URI | Pflicht     | URI des Niveaus.            |

### `niveau`

Folgende Niveaus sind definiert:

-   `tech.studitemps:sprachen:niveau:anfaenger`
-   `tech.studitemps:sprachen:niveau:fortgeschritten`
-   `tech.studitemps:sprachen:niveau:fliessend`
-   `tech.studitemps:sprachen:niveau:muttersprache`

## Transport über RabbmitMQ

| Routing Key                                     | Exchange         |
| ----------------------------------------------- | ---------------- |
| kandidatenprofil.sprachanforderungen-festgelegt | kandidatenprofil |
