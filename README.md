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

## products テーブル（出品）

| Column             | Type   | Options                     |
| ------------------ | ------ | -----------                 |
| name               | string | null: false                 |
| description        | text   | null: false                 |
| category_id        | integer| null: false                 |
| status_id          | integer| null: false                 |
| shipping_charges_id| integer| null: false                 |
| prefecture_id      | integer| null: false                 |
| days_id            | integer| null: false                 |
| price              | integer| null: false                 |
| user_id            | integer| null: false                 |
| purchase_id        | integer| null: false                 |

### Association

- belongs_to :user

## addresses テーブル（配送先）

| Column             | Type   | Options                     |
| ------------------ | ------ | -----------                 |
| post_code          | string | null: false,foreign_key     |
| prefecture         | string | null: false,foreign_key     |
| city               | string | null: false,foreign_key     |
| address            | string | null: false,foreign_key     |
| building_name      | string |                             |
| phone_number       | string | null: false,foreign_key     |

### Association

-belongs_to :purchase

## purchases テーブル（購入）

| Column             | Type   | Options                     |
| ------------------ | ------ | -----------                 |
| comment            | text   | null: false                 |

### Association

- belongs_to :addresses
- belongs_to :purchase
- belongs_to :user