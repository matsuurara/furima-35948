## User

| Culumn             | Type       | Option     |
| :----------------- | :--------- | :--------- |
| nickname           | string     | null:false |
| email              | string     | null:false |
| encrypted_password | string     | null:false |
| zenkaku-name       | string     | null:false |
| zenkaku-kana-name  | string     | null:false |
| birthday           | ActiveHash | null:false |

### Association

-has_many : items

-has_many : orders

## Item

| Culumn           | Type          | Option     |
| :--------------- | :------------ | :--------- |
| name             | string        | null:false |
| text             | text          | null:false |
| status           | string        | null:false |
| delivery-charger | string        | null:false |
| delivery-date    | string        | null:false |
| price            | integer       | null:false |
| category         | ActiveHash    | null:false |
| region           | ActiveHash    | null:false |
| image            | ActiveStorage | null:false |

### Association

-belongs_to : user

-belongs_to : order

## Order

| Culumn | Type       | Option     |
| :----- | :--------- | :--------- |
| price  | integer    | null:false |
| region | ActiveHash | null:false |

### Association

-belongs_to : user

-belongs_to : item
