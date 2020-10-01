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

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| nickname   | string | null: false |
| password   | string | null: false |
| first-name | string | null: false |
| last-name  | string | null: false |
| birthday   | string | null: false |

### Association

- has_many :products
- has_many :orders

## products テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| details    | string     | null: false                    |
| category   | string     | null: false                    |
| status     | string     | null: false                    |
| fee        | string     | null: false                    |
| consigner  | string     | null: false                    |
| days       | string     | null: false                    |
| price      | integer    | null: false                    |
| user-id    | references | null: false, foreign_key: true |

## Association

- has_one    :addresses
- has_one    :orders
- belongs_to :user

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal       | string     | null: false                    |
| prefectures  | string     | null: false                    |
| municipality | string     | null: false                    |
| address      | string     | null: false                    |
| phone_number | string     | null: false                    |
| user-id      | references | null: false, foreign_key: true |
| product-id   | references | null: false, foreign_key: true |
| order-id     | references | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :order
- belongs_to :user

## orders テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| price      | integer    | null: false                    | 
| user-id    | references | null: false, foreign_key: true |
| product-id | references | null: false, foreign_key: true |

### Association

- has_one    :address
- belongs_to :product
- belongs_to :