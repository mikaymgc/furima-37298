# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| last-name          | string | null: false               |
| first-name         | string | null: false               |
| last-name-kana     | string | null: false               |
| first-name-kana    | string | null: false               |
| user_birth_date_y  | date   | null: false               |
| user_birth_date_m  | date   | null: false               |
| user_birth_date_d  | date   | null: false               |

### Association

- has_many :items
- has_many :buys


## items テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| item-name                | string     | null: false                    |
| item-info                | string     | null: false                    |
| item-category            | text       | null: false                    |
| item-status              | string     | null: false                    |
| item-shipping-fee-status | string     | null: false                    |
| item-prefecture          | string     | null: false                    |
| item-scheduled-delivery  | string     | null: false                    |
| item-price               | string     | null: false                    |
| user                     | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination


## destinations テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postcode     | string     | null: false,                   |
| prefecture   | string     | null: false,                   |
| city         | string     | null: false,                   |
| addresses    | string     | null: false,                   |
| building     | string     | null: false,                   |
| phone-number | string     | null: false,                   |
| buy          | string     | null: false, foreign_key: true |

### Association

- belongs_to :buy