## Allgemeine Felder der Events

### Felder die für alle Events gelten

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| @type  | Locator URI  | Pflicht  | 	Auflösbare URLs, die die Typen dieses Events beschreiben. Verweist auf eine Webseite, die das Event beschreibt. Die URL im Beispiel soll ein Redirect auf das Confluence Dokument werden. |
| @id  | [URI](https://tools.ietf.org/html/rfc3986)  | Pflicht  | 	Global eindeutige Identifikation des Events. |
| enacted_by  | [URI](https://tools.ietf.org/html/rfc3986)  | Optional  | 	Wer hat dieses Event ausgelöst? In der Regel referenziert dies einen jobvalley Mitarbeiter. |
| caused_by  | [URI](https://tools.ietf.org/html/rfc3986)  | Pflicht  | Welches andere Event ist diesem Event/Command vorangegangen? Diese ID muß nicht unbedingt eine Event-ID sein, sondern kann auch eigenständig sein, z. B. Command ID/Request ID/Random ID. [Erklärung](https://blog.arkency.com/correlation-id-and-causation-id-in-evented-systems/) |
| correlates_with  | [URI](https://tools.ietf.org/html/rfc3986)  | Pflicht  | Referenziert den ursprünglichen Verursacher der Event-Kette. Diese ID muß nicht unbedingt eine Event-ID sein, sondern kann auch eigenständig sein, z. B. Command ID/Request ID/Random ID. [Erklärung](https://blog.arkency.com/correlation-id-and-causation-id-in-evented-systems/) |
| occurred_at  | [ISO8101 Date and Time](https://en.wikipedia.org/wiki/ISO_8601#Combined_date_and_time_representations)  | Pflicht  | Die Zeit, wann dieses Event aufgetreten ist. |
| unreliable_debugging_data  | Object  | Optional  | Daten, auf die sich keiner verlassen darf und deren (Nicht-)Vorhandensein die Funktion der Systeme in keiner Weise beeinflussen darf. |
| deprecated  | [ISO8101 Date](https://en.wikipedia.org/wiki/ISO_8601#Dates) | Optional  | When present a domain event is considered to be deprecated. The value should be a date after which the domain event will no longer get published. |

Optional bedeutet, dass das Attribut samt Wert nicht im JSON Dokument vorkommen muss, aber darf. Beim einem Pflichtfeld muss Attribut und Wert vorhanden sein.


## Beispiel

```json
{
  "@type": [
    "https://studitemps.tech/specification/BOUNDED-CONTEXT-NAME/EVENT-NAME",
    "https://studitemps.tech/specification/domain-event"
  ],
  "@id": "tech.studitemps:BOUNDED-CONTEXT-NAME:EVENT-NAME:e7f4e458-3da6-427d-88e3-227bbad22062",
  "caused_by": "tech.studitemps:BOUNDED-CONTEXT-NAME:EVENT-NAME:e7f4e458-3da6-427d-88e3-227bbad22062",
  "correlates_with": "tech.studitemps:BOUNDED-CONTEXT-NAME:EVENT-NAME:e7f4e458-3da6-427d-88e3-227bbad22062",
  "enacted_by": "tech.studitemps:identity:studitempsmitarbeiter:email@studitemps.de",
  "occurred_at": "2018-04-22T16:00:00+02:00",
  "unreliable_debugging_data": {},
  "deprecated": "2023-01-01"
}
```

## Anmerkungen

### Aufbau der IDs

Eine stetig steigende sequentielle Nummerierung wäre sinnvoll, da jeder zukünftige Bounded Context über einen Event-Store mit einer ohnehin streng sequentiellen Reihenfolge verfügen sollte. Time based UUIDs könnten diese Rolle aber auch hinreichend ausführen. Denkbar wäre auch die nativen IDs der genutzten Event-Store-Implementation im jeweiligen Bounded Context in die URIs zu integrieren.

Idealerweise sollten hier [Time-based UUIDs (Version 1)](https://tools.ietf.org/html/rfc4122#section-4.2) zum Einsatz kommen. Hiermit lassen sich alle Arbeitszeiten eines Bounded Contexts in eine Ordnung bringen, ohne mit dem produzierenden Bounded Context zu kommunizieren (Eine globale Ordnung kann hiermit nicht erzeugt werden, da wegen der Relativitätstheorie eine akkurate Uhrensynchronisation zwischen den Bounded Contexts schwer fällt).

Um bei Einsatz von Time-based UUIDs eine Ausforschung der Systemlandschaft zu erschweren (IT-Security) sollte hier eine einmalig zufällig generierte Node ID pro produzierenden Bounded Context geprägt werden.

### @type Attribut

Die Idee hinter dem @type Attribut ist, dass dort URLs aufgeführt werden, die das jeweiligen Event menschen- und maschinenlesbar beschreiben. Diese könnten z. B. für Integration-Tests und Linked Data verwendet werden. Die meisten Events verweisen auf eine studitemps.tech Domain, die derzeit noch nicht auflösbar ist (da gibt es noch technische Probleme). Schlussendlich soll die studitemps.tech URL aber auf die Confluence Dokumente weiterleiten.
