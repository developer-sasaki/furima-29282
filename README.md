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


<!-- ここからfurima README書いてみました-->

## usersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| nick_name  | string  | null: false |
| email_address  | string  | null: false |
| encrypted_password  | string  | null: false |
| last_name_zenkaku_kanji  | string  | null: false |
| first_name_zenkaku_kanji  | string  | null: false |
| last_name_kana   | string  | null: false |
| first_name_kana | string  | null: false |
| birth_day  | date  | null: false |

### Association
- has_many :items
- has_many :item_purchases

## item_purchasesテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to:user
- belongs_to:item
- has_one:delivery

## itemsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item_name  | string | null: false |
| price  | integer | null: false |
| genre_id  | integer | null: false |
| user  | references | null: false, foreign_key: true |


### Association
- belongs_to:user
- has_one:item_purchase


## deliveryテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| post_code  | string| null: false |
| prefecture  | integer | null: false |
| city  | string| null: false |
| street1 | string | null: false |
| building   | string |  |
| phone  | string | null: false |
| item_purchase  | references | null: false, foreign_key: true |

### Association
- belongs_to:item_purchase