# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_ruby | string | null: false |
| last_name_ruby  | string | null: false |
| birth           | date   | null: false |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| item_name       | string     | null: false |
| description     | text       | null: false |
| category        | string     | null: false |
| state           | string     | null: false |
| delivery_charge | string     | null: false |
| from_area       | string     | null: false |
| delivery_days   | string     | null: false |
| price           | integer    | null: false |
| nickname        | references | null: false |

### Association
- belongs_to :user
- has_one :purchases

## purchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| nickname  | references | null: false, foreign_key: true |
| item_name | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :addresses

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture     | string     | null: false                    |
| municipalities | string     | null: false                    |
| block          | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| purchases      | references | null: false, foreign_key: true |
### Association

- belongs_to :purchases
