## User

| Culumn             | Type   | Option                  |
| :----------------- | :----- | :---------------------- |
| nickname           | string | null:false, unique:true |
| e_mail             | string | null:false              |
| encrypted_password | string | null:false              |
| last_name          | string | null:false              |
| first_name         | string | null:false              |
| last_name_kana     | string | null:false              |
| first_name_kana    | string | null:false              |
| birthday           | date   | null:false              |

### Association

-has_many : items
-has_many : orders
-has_many : addresses

## Item

| Culumn              | Type    | Option     |
| :------------------ | :------ | :--------- |
| name                | string  | null:false |
| text                | text    | null:false |
| price               | integer | null:false |
| status_id           | integer | null:false |
| delivery_charger_id | integer | null:false |
| delivery_date_id    | integer | null:false |
| category_id         | integer | null:false |
| region_id           | integer | null:false |

### Association

-belongs_to : user
-has_many : order

## Order

| Culumn    | Type    | Option     |
| :-------- | :------ | :--------- |
| price     | integer | null:false |
| region_id | integer | null:false |
| user_id   | integer | null:false |
| item_id   | integer | null:false |

### Association

-belongs_to : user
-belongs_to : item
-belongs_to : address

## Order

| Culumn           | Type    | Option     |
| :--------------- | :------ | :--------- |
| postal_code      | integer | null:false |
| region_id        | integer | null:false |
| cities           | string  | null:false |
| honse_number     | string  | null:false |
| floor            | string  |
| telephone_number | integer | null:false |

### Association

-belongs_to : user
-belongs_to : order