# README

## users テーブル

| Column             | Type     | Options                       |
| ------------------ | ------   | -----------                   |
| nickname           | string   | null: false                   |
| email              | string   | null: false, unique: true     |
| encrypted_password | string   | null: false                   |
| family_name        | string   | null: false                   |
| first_name         | string   | null: false                   |
| family_name_kana   | string   | null: false                   |
| first_name_kana    | string   | null: false                   |
| birth_day          | date     | null: false                   |

### Association

- has_many :products
- has_many :purchase

## products テーブル（出品）

| Column             | Type     | Options                       |
| ------------------ | ------   | -----------                   |
| name               | string   | null: false                   | 
| description        | text     | null: false                   |
| category           | integer  | null: false                   |
| status             | integer  | null: false                   |
| shipping_charges   | integer  | null: false                   |
| prefecture         | integer  | null: false                   |
| days               | integer  | null: false                   |
| price              | integer  | null: false                   |
| purchase           | reference| null: false                   |
| user_id            | reference| null: false                   |
| purchase_id        | reference| null: false                   |

### Association

- belongs_to :users
- belongs_to :purchases
- has_one :addresses
- belongs_to_active_hash :prefecture

## addresses テーブル（配送先）

| Column             | Type     | Options                       |
| ------------------ | ------   | -----------                   |
| post_code          | string   | null: false                   |
| prefecture_id      | integer  | null: false,foreign_key: true |
| city               | string   | null: false                   |
| address            | string   | null: false                   |
| building_name      | string   |                               |
| phone_number       | integer  | null: false                   |

### Association

- belongs_to_active_hash :prefecture
- belongs_to :purchases

## purchases テーブル（購入）

| Column             | Type     | Options                       |
| ------------------ | ------   | -----------                   |
| user_id            | reference| null: false                   |
| purchase_id        | reference| null: false                   |

### Association

- belongs_to :users
- belongs_to :products
- has_one :addresses