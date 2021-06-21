## User

| Culumn             | Type   | Option                  |
| :----------------- | :----- | :---------------------- |
| nickname           | string | null:false              |
| email              | string | null:false, unique:true |
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

| Culumn              | Type       | Option                         |
| :------------------ | :--------- | :----------------------------- |
| name                | string     | null:false                     |
| info                | text       | null:false                     |
| price               | integer    | null:false                     |
| status_id           | integer    | null:false                     |
| delivery_charger_id | integer    | null:false                     |
| delivery_date_id    | integer    | null:false                     |
| category_id         | integer    | null:false                     |
| region_id           | integer    | null:false                     |
| user                | references | null: false, foreign_key: true |

### Association

-belongs_to : user

-has_one : order

## Order

| Culumn | Type       | Option                         |
| :----- | :--------- | :----------------------------- |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

-belongs_to : user

-belongs_to : item

-has_one : address

## Address

| Culumn           | Type       | Option                         |
| :--------------- | :--------- | :----------------------------- |
| postal_code      | string     | null:false                     |
| region_id        | integer    | null:false                     |
| city             | string     | null:false                     |
| house_number     | string     | null:false                     |
| floor            | string     |
| telephone_number | string     | null:false                     |
| order            | references | null: false, foreign_key: true |

### Association

-belongs_to : order
