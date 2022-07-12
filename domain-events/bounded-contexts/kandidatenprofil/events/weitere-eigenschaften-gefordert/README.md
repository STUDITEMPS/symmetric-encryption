# Weitere Eigenschaften gefordert

Das Event wird vom Kandidatenprofil produziert, wenn weiteren Eigenschaften des Kandidaten gefordert werden. Die weiteren Eigenschaften können dabei zum ersten Mal oder erneut festgelegt worden sein. Es werden immer alle aktuellen Eigenschaften geschickt (beim Löschen von allen kommt dann eine leere Liste).

> ℹ️ Die Interpretation der unterschiedlichen weiteren Eigenschaften ist _teilweise_ subjektiv und nicht genau definiert.

## Felder von `fordert_weitere_eigenschaften`

| Name                  | Typ   | Pflichtfeld | Beschreibung                                                        |
| --------------------- | ----- | ----------- | ------------------------------------------------------------------- |
| fuer_auftrag          | URI   | Pflicht     | Auftrag, für den die weiteren Eigenschaften festgelegt wurden       |
| weitere_eigenschaften | [URI] | Pflicht     | Liste von allen aktuellen "weiteren Eigenschaften" (kann leer sein) |

### Mögliche "Weitere Eigenschaften" URIs

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

## Transport über RabbitMQ

| Routing Key                                      | Exchange         |
| ------------------------------------------------ | ---------------- |
| kandidatenprofil.weitere-eigenschaften-gefordert | kandidatenprofil |
