# README

## users テーブル

| Column             | Type     | Options                      |
| ------------------ | ------   | -----------                  |
| nickname           | string   | null: false                  |
| email              | string   | null: false, unique: true    |
| encrypted_password | string   | null: false                  |
| family_name        | string   | null: false                  |
| first_name         | string   | null: false                  |
| family_name_kana   | string   | null: false                  |
| first_name_kana    | string   | null: false                  |
| birth_day          | date     | null: false                  |

### Association

- has_many :products
- has_many :purchases

## products テーブル（出品）

| Column             | Type     | Options                      |
| ------------------ | ------   | -----------                  |
| name               | string   | null: false                  | 
| description        | text     | null: false                  |
| category_id        | integer  | null: false                  |
| status_id          | integer  | null: false                  |
| shipping_charge_id | integer  | null: false                  |
| prefecture_id      | integer  | null: false                  |
| days_id            | integer  | null: false                  |
| price              | integer  | null: false                  |
| user               | references| null: false                 |

### Association

- belongs_to :user
- has_one :purchase
- belongs_to :prefecture

## addresses テーブル（配送先）

| Column             | Type     | Options                      |
| ------------------ | ------   | -----------                  |
| post_code          | string   | null: false                  |
| prefectures_id     | string   | null: false,foreign_key: true|
| city               | string   | null: false,foreign_key: true|
| address            | string   | null: false,foreign_key: true|
| building_name      | string   |                              |
| phone_number       | integer  | null: false,foreign_key: true|

### Association

- belongs_to :purchase

## purchases テーブル（購入）

| Column             | Type      | Options                       |
| ------------------ | ------    | -----------                   |
| user               | references| null: false,foreign_key: true|
| purchase           | integer   | null: false,foreign_key: true|

### Association

- belongs_to :user
- belongs_to :product
- has_one :address