## Bounded Kontext

Auftragskonfiguration produziert das Event `Zendesk Sell Unternehmen verknüpft`, sobald ein Auftrag mit einem Zendesk-Sell-Unternehmen verknüpft wurde. Diese Verknüpfung kann sich jederzeit ändern.

## Felder des Events

| Name                                | Typ    | Pflichtfeld | Beschreibung                              |
| ----------------------------------- | ------ | ----------- | ----------------------------------------- |
| verknuepft_zendesk_sell_unternehmen | Object | Pflicht     | Das verknuepfte Zendesk-Sell-Unternehmen. |

## Felder von verknuepft_zendesk_sell_unternehmen

| Name                     | Typ | Pflichtfeld | Beschreibung                                                                                                       |
| ------------------------ | --- | ----------- | ------------------------------------------------------------------------------------------------------------------ |
| zendesk_sell_unternehmen | URI | Pflicht     | Zendesk Sell ID des Unternehmens. (Gleiche ID, die man auch in Zendesk Sell in der URL sieht, als URI formattiert) |
| mit_auftrag              | URI | Pflicht     | URI des Auftrags mit dem das Zendesk-Sell-Unternehmen verknüpft wird.                                              |

## Transport über RabbmitMQ

| Routing Key                                               | Exchange              |
| --------------------------------------------------------- | --------------------- |
| auftragskonfiguration.zendesk-sell-unternehmen-verknuepft | auftragskonfiguration |
