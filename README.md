# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# テーブル設計

## users table
| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| nickname     | string | null false  |
| password     | string | null false  |
| email        | string | null false  |
| name         | string | null false  |
| surname      | string | null false  |
| kana_name    | string | null false  |
| kana_surname | string | null false  |
| birthday     | date   | null false  |

### Association

- has many : items
- has many : orders

## items table
| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| user_id          | references | null false,foreign_key: true  |
| name             | string     | null false                    |
| description      | text       | null false                    |
| category_id      | integer    | null false                    |
| condition_id     | integer    | null false                    |
| shipping_fee_id  | integer    | null false                    |
| shipping_area_id | integer    | null false                    |
| shipping_date_id | integer    | null false                    |
| price            | integer    | null false                    |

### Association

- has _one :orders
- belongs_to : users



## address table

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| postal_code     | string  | null false  |
| prefecture_id   | integer | null false  |
| city            | string  | null false  |
| address         | string  | null false  |
| buildings       | string  | null false  |
| phone           | string  | null false  |

### Association

- belongs_to : orders

## orders table

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| item_id         | references | foreign_key:true  |
| user_id         | references | foreign_key:true  |

### Association
- has_one :address
- belongs_to : users
- belongs_to : items