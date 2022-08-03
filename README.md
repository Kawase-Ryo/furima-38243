# README

## users テーブル

| Column             | Type   | Options                     |
| ------------------ | ------ | -----------                 |
| nickname           | string | null: false                 |
| email              | string | null: false, unique: true   |
| encrypted_password | string | null: false                 |
| family_name        | string | null: false                 |
| first_name         | string | null: false                 |
| family_name_kana   | string | null: false                 |
| first_name_kana    | string | null: false                 |
| birth_day          | date   | null: false                 |

### Association

- has_many :products dependent: :destroy
- belongs_to :destination dependent: :destroy

## destination テーブル

| Column             | Type   | Options                     |
| ------------------ | ------ | -----------                 |
| family_name        | string | null: false                 |
| first_name         | string | null: false                 |
| family_name_kana   | string | null: false                 |
| first_name_kana    | string | null: false                 |
| user_id            | integer| null: false,foreign_key:true|

### Association

- belongs_to :user

## addresses テーブル

| Column             | Type   | Options                     |
| ------------------ | ------ | -----------                 |
| post_code          | string | null: false                 |
| prefecture         | string | null: false                 |
| city               | string | null: false                 |
| adress             | string | null: false                 |
| building_name      | string |                             |
| phone_numder       | string | null: false                 |
| user_id            | integer| null: false,foreign_key:true|

## Association

- belongs_to :user

## puchases テーブル

| Column             | Type   | Options                     |
| ------------------ | ------ | -----------                 |
| name               | string | null: false                 |
| price              | string | null: false                 |
| description        | string | null: false                 |
| status_id          | integer| null: false                 |
| judgment           | string |                             |
| size               | string | null: false                 |
| cost_id            | integer| null: false                 |
| days               | string | null: false                 |
| prefecture_id      | integer|                             |
| category_id        | integer| null: false                 |

### Association

- belongs_to :user dependent: :destroy
- belongs_to :category dependent: :destroy
- belongs_to_active_hash :prefecture
