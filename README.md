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

- has_many :destination dependent: :destroy

## product テーブル（出品）

| Column             | Type   | Options                     |
| ------------------ | ------ | -----------                 |
| name               | string | null: false                 |
| price              | string | null: false                 |
| description        | string | null: false                 |
| status_id          | integer| null: false                 |
| judgment           | string |                             |
| prefecture         | string | null: false                 |
| category_id        | integer| null: false                 |
| user_id            | integer| null: false,foreign_key:true|

### Association

- belongs_to :user
- belongs_to :address


## addresses テーブル（配送先）

| Column             | Type   | Options                     |
| ------------------ | ------ | -----------                 |
| post_code          | string | null: false                 |
| prefecture         | string | null: false                 |
| city               | string | null: false                 |
| address            | string | null: false                 |
| building_name      | string |                             |
| phone_number       | string | null: false                 |
| user_id            | integer| null: false,foreign_key:true|

### Association

- belongs_to :destination

## purchases テーブル（購入）

| Column             | Type   | Options                     |
| ------------------ | ------ | -----------                 |
| name               | string | null: false                 |
| price              | string | null: false                 |
| description        | string | null: false                 |
| status_id          | integer| null: false                 |
| judgment           | string |                             |
| cost_id            | integer| null: false                 |
| days               | string | null: false                 |
| category_id        | integer| null: false                 |

### Association

- belongs_to :user dependent: :destroy
- belongs_to :category dependent: :destroy
- belongs_to_active_hash :prefecture
