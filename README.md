# README

## users テーブル

| Column             | Type   | Options                     |
| ------------------ | ------ | -----------                 |
| nickname           | string | null: false                 |
| email              | string | null: false, unique: true   |
| encrypted_password | string | null: false                 |
| user_image         | string |                             |
| family_name        | string | null: false                 |
| first_name         | string | null: false                 |
| family_name_kana   | string | null: false                 |
| first_name_kana    | string | null: false                 |
| birth_day          | date   | null: false                 |
| introduction       | text   | null: false                 |

### Association

- has_many :products dependent: :destroy
- belongs_to :destination dependent: :destroy
- belongs_to :card dependent: :destroy

## destination テーブル

| Column             | Type   | Options                     |
| ------------------ | ------ | -----------                 |
| family_name        | string | null: false                 |
| first_name         | string | null: false                 |
| family_name_kana   | string | null: false                 |
| first_name_kana    | string | null: false                 |
| post_code          | string | null: false                 |
| prefecture         | string | null: false                 |
| city               | string | null: false                 |
| adress             | string | null: false                 |
| building_name      | string |                             |
| phone_numder       | string | null: false                 |
| user_id            | integer| null: false,foreign_key:true|

### Association

- belongs_to :user

## product テーブル

| Column             | Type   | Options                     |
| ------------------ | ------ | -----------                 |
| name               | string | null: false                 |
| price              | string | null: false                 |
| description        | string | null: false                 |
| status             | string | null: false                 |
| judgment           | string |                             |
| size               | string | null: false                 |
| days               | string | null: false                 |
| prefecture_id      | string |                             |
| category_id        | string | null: false                 |

### Association

- belongs_to :user dependent: :destroy
- belongs_to :category dependent: :destroy
- belongs_to :brand dependent: :destroy
- has_many :images dependent: :destroy
- belongs_to_active_hash :prefecture


