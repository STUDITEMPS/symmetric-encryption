## Bounded Kontext

Der Kontext Assessment produziert das Event, sobald ein Customer Success Manager bewertet, dass ein:e Student:in weitere für jobvalley-Aufträge wichtige Eigenschaften mitbringt.

## Felder von bewertet_weitere_eigenschaften

| Name                  | Typ   | Pflichtfeld | Beschreibung                                                      |
| --------------------- | ----- | ----------- | ----------------------------------------------------------------- |
| student               | URI   | Pflicht     | Global eindeutige Identifikation de:r:s Student:en:in             |
| weitere_eigenschaften | Array | Pflicht     | Liste an weiteren Eigenschaften, die der:die Student:in mitbringt |

### Weitere Eigenschaften URIs

-   `tech.studitemps:eigenschaft:erreicht-abgelegene-einsatzorte`
-   `tech.studitemps:eigenschaft:fuehrerschein-klasse-b`
-   `tech.studitemps:eigenschaft:staplerschein`
-   `tech.studitemps:eigenschaft:handwerkliche-begabung`
-   `tech.studitemps:eigenschaft:ifsg-paragraph-43-belehrung`
-   `tech.studitemps:eigenschaft:koerperliche-belastbarkeit`
-   `tech.studitemps:eigenschaft:pc-kenntnisse`
-   `tech.studitemps:eigenschaft:sicherheitsschuhe`
-   `tech.studitemps:eigenschaft:technische-affinitaet`
-   `tech.studitemps:eigenschaft:kassenerfahrung`

## Transport über RabbmitMQ

| Routing Key                               | Exchange   |
| ----------------------------------------- | ---------- |
| assessment.weitere-eigenschaften-bewertet | assessment |
