## App Account gelöscht

## Bounded Kontext

Kontext Studentenverwaltung wirft dieses Event, wenn der App-Account eines Studenten gelöscht wird.

## Feldname

`loescht_app_account`

## Felder von loescht_app_account

| Name | Typ  | Pflichtfeld  | Beschreibung  |
|---|---|---|---|
| student | URI | Pflicht  | Global eindeutige Identifikation des Studenten. |
| app_account_id | String | Optional  | Identifikation des App-Accounts (Firebase). |

## Transport über RabbmitMQ

| Routing Key | Exchange  |
|---|---|
| studentenverwaltung.app-account-geloescht | studentenverwaltung  |
