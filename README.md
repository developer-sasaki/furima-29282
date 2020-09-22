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


<!-- ここからfurima README書いてみた -->

## usersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| nick_name  | string  | null: false |
| email_address  | string  | null: false |
| password | string  | null: false |
| last_name_zenkaku_kanji  | string  | null: false |
| first_name_zenkaku_kanji  | string  | null: false |
| last_name_kana   | string  | null: false |
| first_name_kana | string  | null: false |
| birth_day  | string  | null: false |
| item_id  | references | null: false, foreign_key: true |

### Association
- has_many :items
- has_many :transaction
- has_many :delivery

## transactionテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association
- belongs_to:users
- belongs_to:items
- has_many:delivery

## itemsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item_name  | string | null: false |
| image  | references | null: false|
| url | references | null: false |
| price  | integer | null: false |
| seller  | string | null: false |
| item_category   | string | null: false |
| item_status | string | null: false |
| delivery_terms  | string | null: false |
| place_of_origin | string | null: false |
| shipping_status | string | null: false |
| users_id  | references | null: false, foreign_key: true |
| transaction_id | references | null: false, foreign_key: true |


### Association
- belongs_to:users
- has_one:transaction
- has_one:delivery


## deliveryテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| pick_up_address  from   | string | null: false |
| deliver_to_name   | string | null: false |
| deliver_to_phone  | string | null: false |
| post_code  | string | null: false |
| prefecture  | string | null: false |
| city  | string| null: false |
| street1 | string | null: false |
| street2  | string | null: false |
| building   | string | null: false |
| standers_delivery_date | integer | null: false |
| date_of_delivery  | integer | null: false |
| confirmation_of_received | string | null: false |
| item_id  | references | null: false, foreign_key: true |
| transaction_id  | references | null: false, foreign_key: true |
| users_id  | references | null: false, foreign_key: true |

### Association
- belongs_to:users
- belongs_to:items
- belongs_to:transaction