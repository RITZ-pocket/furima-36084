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
| phone_number       | string   | null:false, unique:true |

## items テーブル

| Colum        | Type      | Option           |
| ------------ | --------- | ---------------- |
| name         | string    | null:false       |
| price        | integer   | null:false       |
| introduction | text      | null:false       |
| image        |           |                  |
| user_id      | reference | foreign_key:true |

## ships テーブル

| Colum     | Type      | Option           |
| --------- | --------- | ---------------- |
| post_code | string    | null:false       |
| city      | integer   | null:false       |
| address   | string    | null:false       |
| user_id   | reference | foreign_key:true |
| item_id   | reference | foreign_key:true |

## purchases テーブル

| Colum   | Type      | Option           |
| ------- | --------- | ---------------- |
| card    | integer   | null:false       |
| user_id | reference | foreign_key:true |
| item_id | reference | foreign_key:true |