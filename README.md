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
| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| nickname     | strings | null false  |
| password     | strings | null false  |
| email        | strings | null false  |
| name         | strings | null false  |
| surname      | strings | null false  |
| kana_name    | strings | null false  |
| kana_surname | strings | null false  |
| birthday     | strings | null false  |

### Association

- has many : items
- has one : credit_card
- has one : address

## items table
| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| item_id       | integer | null false  |
| name          | strings | null false  |
| description   | strings | null false  |
| category      | strings | null false  |
| condition     | strings | null false  |
| shipping_fee  | strings | null false  |
| shipping_area | strings | null false  |
| shipping_date | strings | null false  |
| price         | strings | null false  |

### Association

- belongs_to : users

## credit_card table
| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| card_number     | strings | null false  |
| expiration_date | strings | null false  |
| security_code   | strings | null false  |

### Association

- belongs_to : user

## address table

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| postal_code     | integer | null false  |
| prefectures     | strings | null false  |
| city            | strings | null false  |
| address         | strings | null false  |
| buildings       | strings | null false  |
| phone           | integer | null false  |

### Association

- belongs_to : users
