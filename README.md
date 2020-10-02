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
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null false  |
| encrypted_password | string | null false  |
| email              | string | null false  |
| name               | string | null false  |
| surname            | string | null false  |
| kana_name          | string | null false  |
| kana_surname       | string | null false  |
| birthday           | date   | null false  |

### Association

- has many : items
- has many : orders

## items table
| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| user             | references | null false,foreign_key: true  |
| name             | string     | null false                    |
| description      | text       | null false                    |
| category_id      | integer    | null false                    |
| condition_id     | integer    | null false                    |
| shipping_fee_id  | integer    | null false                    |
| shipping_area_id | integer    | null false                    |
| shipping_date_id | integer    | null false                    |
| price            | integer    | null false                    |

### Association

- has _one : order
- belongs_to : user

## orders table
| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| item         | references | foreign_key:true  |
| user         | references | foreign_key:true  |

### Association
- has_one : address
- belongs_to : user
- belongs_to : item

## address table
| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| order           | references | foreign_key:true  |
| postcode        | string     | null false        |
| prefecture_id   | integer    | null false        |
| city            | string     | null false        |
| address         | string     | null false        |
| building        | string     |                   |
| phone           | string     | null false        |

### Association

- belongs_to : order