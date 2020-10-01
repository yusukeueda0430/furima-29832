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

## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| email          | string | null: false |
| nickname       | string | null: false |
| password       | string | null: false |
| first_name     | string | null: false |
| first_hurigana | string | null: false |
| last_name      | string | null: false |
| last_hurigana  | string | null: false |
| birthday       | date   | null: false |

### Association

- has_many :products
- has_many :orders

## products テーブル

| Column       | Type       | Options                        |
| ----------   | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| details      | text       | null: false                    |
| category_id  | integer    | null: false                    |
| status_id    | integer    | null: false                    |
| fee_id       | integer    | null: false                    |
| consigner_id | integer    | null: false                    |
| days_id      | integer    | null: false                    |
| price        | integer    | null: false                    |
| user_id      | integer    | null: false  foreign_key: true |

## Association

- has_one    :order
- belongs_to :user

## addresses テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| postal        | string     | null: false                    |
| prefectures   | integer    | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order_id      | integer    | null: false, foreign_key: true |

### Association

- belongs_to :order

## orders テーブル

| Column      | Type       | Options                        |
| ----------  | ---------- | ------------------------------ |
| user_id     | integer    | null: false, foreign_key: true |
| product_id  | integer    | null: false, foreign_key: true |

### Association

- has_one   :address
- belong_to :user
- belong_to :product