## Langzeitvertrag Beantragt

## Bounded Kontext

## Feldname

`beantragt_langzeitvertrag`

## Felder von beantragt_langzeitvertrag

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| student | URI | Pflicht  | URI der Studenten, der im Vertrag steht |
| von | ISO 8601 Date | Pflicht | Anfang der Vertragslaufzeit |
| bis | ISO 8601 Date | Pflicht | Ende der Vertragslaufzeit |
| wochenstunden | Decimal | Pflicht | Anzahl der zu leistenden Wochenstunden |
| beantragt_von | URI | Pflicht | Mitarbeiter den den Vertrag beantragt |

## Transport über RabbmitMQ

| Routing Key  | Exchange  |
|---|---|
| studentenanstellung.langzeitvertrag-beantragt | studentenanstellung  |