# Langzeitvertrag versendet

Dies ist ein [Summary Event](http://verraes.net/2019/05/patterns-for-decoupling-distsys-summary-event/) welches die Daten der vorangegangenen Events (z. B. Langzeitvertrag beantrag, gekündigt usw.) akkumuliert. Es wird emittiert, sobald der Langzeitvertrag versandt wurde.

Der Vertrag wird sofort nach Erstellung versendet. Das Erstellen wird aus Staffing heraus manuell vom Customer Success Manager getriggert.

Vertragsversionierung: Bei Vertragserstellung wird die erste Version erstellt. Anschließend ist vorgesehen, dass bei jeder Änderung am Vertrag, die der Student zur Kenntnis nehmen muss eine neue Version erstellt wird. In der Praxis bzw. aktuell können die Verträge aber nicht mehr verändert werden (die Verträge werden aktuell gekündigt). Das bedeutet, dass auch keine weiteren Versionen erstellt werden.

Wochenstunden: Die Arbeitszeit kann sich nur in einem vorgegebenen Rahmen bewegen. Sie muss > 0 sein und darf ein maximum (aktuell bei 168 konfiguriert) nicht überschreiten.

## Feldname

`dokumentiert_langzeitvertrag_versand`

## Felder von dokumentiert_langzeitvertrag_versand

|      Name      |        Typ         | Pflichtfeld |                                       Beschreibung                                        |
| -------------- | ------------------ | ----------- | ----------------------------------------------------------------------------------------- |
| @id            | URI                | Pflicht     | Global eindeutige Identifikation des Arbeitsvertrags.                                     |
| version        | Integer            | Pflicht     | Version der Arbeitsvertrags                                                               |
| vertragsnummer | String             | Pflicht     | Nummer der Arbeitsvertrags (Steht auf den PDFs zur einfachen Identifikation des Vertrags) |
| student        | URI                | Pflicht     | URI der Studenten, der im Vertrag steht                                                   |
| download_url   | URI                | Pflicht     | URL des Vertrags-PDF.                                                                     |
| von            | ISO 8601 Timestamp | Pflicht     | Datum ab wann der Vertrag gelten soll                                                     |
| bis            | ISO 8601 Timestamp | Pflicht     | Datum wann der Vertrag enden soll                                                         |
| wochenstunden  | Decimal            | Pflicht     | Wochenstunden                                                                             |
| versendet_am   | Datum ISO          | Pflicht     | Datum des Versandts                                                                       |
| beantragt_von  | URI                | Pflicht     | Der jobvalley Mitarbeiter, der den Vertrag beantragt hat.                                |

## Transport über RabbmitMQ

|                  Routing Key                  |      Exchange       |
| --------------------------------------------- | ------------------- |
| studentenanstellung.langzeitvertrag-versendet | studentenanstellung |
