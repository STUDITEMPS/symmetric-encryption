## Auftrag fuer Rekrutierung relevant

## Bounded Kontext

Das Event "Auftrag für Rekrutierung relevant" wird von der Auftragskonfiguration produziert, sobald ein Auftrag relevant wird.

Ein Auftrag kann relevant werden, wenn
1. das Einsatzende in der Zukunft liegt UND
2. der Auftrag nicht gelöscht ist UND
3.
    a) es Schichten mit Vakanzen in der Zukunft gibt ODER </br>
    b) der Auftrag als relevant markiert wurde

```
1 && 2 && (3a || 3b)
```

## `relevant_fuer_rekrutierung`

| Name    | Type | Pflichtfeld | Beschreibung                  |
| ------- | ---- | ----------- | ----------------------------- |
| auftrag | URI  | Pflicht     | Auftrag, der nun relevant ist |

## Transport über RabbmitMQ

| Routing Key                                              | Exchange              |
| -------------------------------------------------------- | --------------------- |
| auftragskonfiguration.auftrag-fuer-rekrutierung-relevant | auftragskonfiguration |
