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

## Item

| Culumn              | Type       | Option     |
| :------------------ | :--------- | :--------- |
| name                | string     | null:false |
| text                | text       | null:false |
| price               | integer    | null:false |
| status_id           | integer    | null:false |
| delivery_charger_id | integer    | null:false |
| delivery_date_id    | integer    | null:false |
| category_id         | integer    | null:false |
| region_id           | integer    | null:false |
| user                | references |

### Association

-belongs_to : user

-has_many : order

## Order

| Culumn | Type       | Option |
| :----- | :--------- | :----- |
| user   | references |
| item   | references |

### Association

-belongs_to : user

-belongs_to : item

-belongs_to : address

## Address

| Culumn           | Type       | Option     |
| :--------------- | :--------- | :--------- |
| postal_code      | integer    | null:false |
| region_id        | integer    | null:false |
| cities           | string     | null:false |
| house_number     | string     | null:false |
| floor            | string     |
| telephone_number | integer    | null:false |
| order            | references |

### Association

-belongs_to : order
