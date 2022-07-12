## Bounded Kontext

Auftragskonfiguration produziert das Event Rechtliche Unternehmenszuordnung Festgelegt, sobald die rechtliche Zuordnung geändert wird. Dabei handelt es sich aktuell um die Handelsregisternummern (Nummer + Gericht) und einen Legal Name (Unternehmensname inklusive Rechtsform)

1.  Handelsregisternummer sollte immer inklusive Landgericht in Zendesk Zell eingetragen werden. Aber es gibt auch "Unternehmen" die keine Handelsregisternummer haben.
2.  Legal Name sollte immer mit Rechtsform in Zendesk Zell eingetragen sein.

Das Event wird nur veröffentlich, wenn mindestens einer der Werte vorhanden ist.

Man kann die Zendesk Verknüpfung im Auftrag anpassen und somit das Event mehrfach triggern für einen Auftrag.

## Felder des Events

| Name                                       | Typ    | Pflichtfeld | Beschreibung                       |
| ------------------------------------------ | ------ | ----------- | ---------------------------------- |
| legt_rechtliche_unternehmenszuordnung_fest | Object | Pflicht     | Die festgelegte Zeiterfassungsart. |

## Felder von legt_rechtliche_unternehmenszuordnung_fest

| Name                  | Typ    | Pflichtfeld | Beschreibung                                                                                                              |
| --------------------- | ------ | ----------- | ------------------------------------------------------------------------------------------------------------------------- |
| handelsregisternummer | String | Optional    | In Zendesk Sell eingetragene Handelsregisternummer. Sollte immer aus der Nummer und dem zugehörigen Amtsgericht bestehen. |
| firmenname_legal      | String | Optional    | In Zendesk Sell eingetragener "Firmenname Legal". Sollte immer der Unternehmensname inklusive Rechtsform sein.            |
| fuer_auftrag          | URI    | Pflicht     | URI des Auftrags, für den die rechtliche Zuordnung festgelegt wurde.                                                      |

## Transport über RabbmitMQ

| Routing Key                                                       | Exchange              |
| ----------------------------------------------------------------- | --------------------- |
| auftragskonfiguration.rechtliche-unternehmenszuordnung-festgelegt | auftragskonfiguration |
