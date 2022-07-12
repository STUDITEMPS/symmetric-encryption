## Auftrag markiert

## Bounded Kontext

Das Event "Auftrag markiert" wird von der Auftragskonfiguration produziert, sobald ein CSM/A einen Auftrag markiert.

Die Auftrags-Markierung ist ein Grund dafür, einen Auftrag als "relevant" für die Rekrutierung anzusehen. Die Markierung kann gesetzt werden, um Aufträgen arbiträr für die Rekrutierung als relevant zu markieren und die autmoatisch ermittelte Relevanz zu überschreiben.

## `markiert_auftrag`

| Name    | Type | Pflichtfeld | Beschreibung                |
| ------- | ---- | ----------- | --------------------------- |
| auftrag | URI  | Pflicht     | Auftrag, der markiert wurde |

## Transport über RabbmitMQ

| Routing Key                            | Exchange              |
| -------------------------------------- | --------------------- |
| auftragskonfiguration.auftrag-markiert | auftragskonfiguration |
