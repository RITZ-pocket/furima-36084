## users テーブル

|  Colum             |  Type    |  Option                 |
| ------------------ | -------- | ----------------------- |
| nickname           | string   | null:false              |
| email              | string   | null:false, unique:true |
| encrypted_password | string   | null:false              |
| family_name        | string   | null:false              |
| family_name_kana   | string   | null:false              |
| first_name         | string   | null:false              |
| first_name_kana    | string   | null:false              |
| birth_date         | date     | null:false              |

## Association

has_many:items
has_many:purchases

## items テーブル

| Colum             | Type      | Option           |
| ----------------- | --------- | ---------------- |
| name              | string    | null:false       |
| price             | integer   | null:false       |
| introduction      | text      | null:false       |
| category_id       | integer   | null:false       |
| item_condition_id | integer   | null:false       |
| postage_payer_id  | integer   | null:false       |
| shipping_area_id  | integer   | null:false       |
| day_to_ship_id    | integer   | null:false       |
| user              | reference | foreign_key:true |

## Association

belongs_to:user
has_one:purchase

## ships テーブル

| Colum           | Type      | Option           |
| ---------------- | --------- | ---------------- |
| post_code        | string    | null:false       |
| shipping_area_id | integer   | null:false       |
| city             | string    | null:false       |
| address          | string    | null:false       |
| building_name    | string    |                  |
| phone_number     | string    | null:false       |
| purchases        | reference | foreign_key:true |

## Association

belongs_to:purchase

## purchases テーブル

| Colum | Type      | Option           |
| ----- | --------- | ---------------- |
| user  | reference | foreign_key:true |
| item  | reference | foreign_key:true |

## Association

belongs_to:user
belongs_to:item
has_one:ship