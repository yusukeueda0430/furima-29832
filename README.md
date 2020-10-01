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

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| details    | text       | null: false                    |
| category   | integer    | null: false                    |
| status     | integer    | null: false                    |
| fee        | integer    | null: false                    |
| consigner  | integer    | null: false                    |
| days       | integer    | null: false                    |
| price      | integer    | null: false                    |

## Association

- has_one    :address
- has_one    :order
- belongs_to :user

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal       | string     | null: false                    |
| prefectures  | string     | null: false                    |
| municipality | string     | null: false                    |
| address      | string     | null: false                    |
| phone_number | string     | null: false                    |
| user_id      | references | null: false, foreign_key: true |
| product_id   | references | null: false, foreign_key: true |
| order_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :order

## orders テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |

### Association

- has_one    :address