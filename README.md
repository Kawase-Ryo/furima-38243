# NAME: FURIMAアプリ

## Overview

　　・フリーマーケットのアプリケーションの様なアプリです。
  
## Description

　　・このアプリにアクセスしたユーザーは、誰でも閲覧することが可能
  
　　・ユーザー登録することで、出品・購入が可能になる
  
　　・出品の後の編集・削除が可能
  
　　・ログアウト後も、閲覧のみ可能

### 1.ユーザー登録機能

　　・ユーザー登録することで出品・購入できるようになります。
  
　　（ユーザー登録していない人でも出品している商品を見ることは可能です。）
  
https://user-images.githubusercontent.com/108600127/219843330-1f698212-8f5a-4fb5-aac0-298b3afd38f8.mp4
  
### 2.ユーザーログイン機能

　　・ユーザーログインすることで出品・購入できるようになります。
  
　　（ユーザー登録していない人でも出品している商品を見ることは可能です。）
  
https://user-images.githubusercontent.com/108600127/219843333-bb838b25-403f-42f5-a0fa-4dcfd516825c.mp4

## 3.商品出品機能

　　・商品画像を選択し、商品情報や販売したい金額を入力すると、出品することができます。
  
　　（JavaScriptで販売手数料が表示されるようになっています。）
  
https://user-images.githubusercontent.com/108600127/219843349-85175175-c079-4425-b0b6-3e89f4098d07.mp4
  
### 4.商品の編集機能

　　・出品した商品について、編集することができます。
  
　　その際に、ユーザーの手間を省くため出品時の情報が表示されるようになっています。

https://user-images.githubusercontent.com/108600127/219843357-7b7a82ea-d5ad-45b1-82a0-84d26aa04894.mp4
  
### 5.商品の削除機能

　　・出品中であった商品について、削除ボタンを押すことで商品を削除することができます。
  
https://user-images.githubusercontent.com/108600127/219843365-2cbfbd85-9327-4d15-862e-9078fe27eb17.mp4
  
### 6.ログアウト機能

　　・ユーザーがログアウト可能です。
  
  （ログアウト後も出品している商品を見ることは可能です。）
  
https://user-images.githubusercontent.com/108600127/219843382-8b5a83fb-af2f-45b4-ac4f-20eef9cd3342.mp4
  
  
### 7.ER diagram

　　・ER図
  
![firima](https://user-images.githubusercontent.com/108600127/219843394-bf79f812-786c-4b9d-97b6-d453b772755e.png)
  
  
# README

## users テーブル

| Column             | Type      | Options                       |
| ------------------ | ------    | -----------                   |
| nickname           | string    | null: false                   |
| email              | string    | null: false, unique: true     |
| encrypted_password | string    | null: false                   |
| family_name        | string    | null: false                   |
| first_name         | string    | null: false                   |
| family_name_kana   | string    | null: false                   |
| first_name_kana    | string    | null: false                   |
| birth_day          | date      | null: false                   |

### Association

- has_many :items
- has_many :orders

## items テーブル（出品）

| Column             | Type      | Options                      |
| ------------------ | ------    | -----------                  |
| name               | string    | null: false                  | 
| description        | text      | null: false                  |
| category_id        | integer   | null: false                  |
| status_id          | integer   | null: false                  |
| shipping_charge_id | integer   | null: false                  |
| prefecture_id      | integer   | null: false                  |
| shipping_day_id    | integer   | null: false                  |
| price              | integer   | null: false                  |
| user               | references| null: false,foreign_key: true|

### Association

- belongs_to :user
- has_one :order

## Payments テーブル（配送先）

| Column             | Type      | Options                      |
| ------------------ | ------    | -----------                  |
| post_code          | string    | null: false                  |
| prefecture_id      | integer   | null: false                  |
| city               | string    | null: false                  |
| address            | string    | null: false                  |
| building_name      | string    |                              |
| phone_number       | string    | null: false                  |
| order              | references| null: false,foreign_key: true|

### Association

- belongs_to :order

## orders テーブル（購入）

| Column             | Type      | Options                      |
| ------------------ | ------    | -----------                  |
| user               | references| null: false,foreign_key: true|
| item               | references| null: false,foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :Payment
