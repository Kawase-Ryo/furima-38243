# README

## users テーブル

| Column             | Type   | Options                     |
| ------------------ | ------ | -----------                 |
| image              | string | null: false                 |
| nickname           | string | null: false                 |
| email              | string | null: false, unique: true   |
| password           | string | null: false                 |
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
| image_id           | string | null: false                 |
| name               | string | null: false                 |
| description        | text   | null: false                 |
| category           | integer| null: false                 |
| status             | integer| null: false                 |
| shipping_charges   | integer|                             |
| prefecture         | string | null: false                 |
| days               | string | null: false                 |
| price              | integer| null: false                 |
| commission         | integer|                             |
| profit             | integer|                             |
| user_id            | integer| null: false,                |
| purchase_id        | integer| null: false,                |

### Association

- belongs_to :user
- belongs_to :purchase


## addresses テーブル（配送先）

| Column             | Type   | Options                     |
| ------------------ | ------ | -----------                 |
| post_code          | string | null: false                 |
| prefecture         | string | null: false                 |
| city               | string | null: false                 |
| address            | string | null: false                 |
| building_name      | string |                             |
| phone_number       | string | null: false                 |


### Association

-has_many :purchases

## purchases テーブル（購入）

| Column             | Type   | Options                     |
| ------------------ | ------ | -----------                 |
| description_id     | text   | null: false                 |
| name_id            | string | null: false                 |
| price_id           | string | null: false                 |
| category_id        | integer| null: false                 |
| status_id          | integer| null: false                 |
| shipping_charges_id| integer|                             |
| prefecture         | string | null: false                 |
| days_id            | string | null: false                 |
| comment            | text   | null: false                 |

### Association

- belongs_to :addresses
- belongs_to :purchase
- belongs_to :user