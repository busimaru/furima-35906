# テーブル設計

## users テーブル
| Column             | Type       | Options                  |
| ------------------ | ------     | -------------------------|
| nickname           | string     | null: false              | #ユーザー名
| email              | string     | null: false,unique: true | #メールアドレス
| encrypted_password | string     | null: false              | #パスワード
| name_family        | string     | null: false              | #本名(姓,漢字)
| name_first         | string     | null: false              | #本名(名,漢字)
| name_kana_family   | string     | null: false              | #本名(姓,カタカナ)
| name_kana_first    | string     | null: false              | #本名(名,カタカナ) 
| birthday           | date       | null: false              | #生年月日

### Association
- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| name               | string     | null: false                    | #商品名
| text               | text       | null: false                    | #商品説明
| price              | integer    | null: false                    | #値段
| category_id        | integer    | null: false                    | #商品カテゴリー
| condition_id       | integer    | null: false                    | #商品状態
| delivery_fee_id    | integer    | null: false                    | #送料の有無
| prefecture_id      | integer    | null: false                    | #発送元
| delivery_day_id    | integer    | null: false                    | #発送日の目安

### Association
- belongs_to :user
- has_one    :purchase

＃商品カテゴリー、商品状態、送料の有無、発送元、発送日の目安はプルダウン形式で実装

## comments テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

- belongs_to    :user
- belongs_to    :item

## orders テーブル
| Column                | Type       | Options                        |
| --------------------  | ---------- | ------------------------------ |
| user                  | references | null: false, foreign_key: true |
| item                  | references | null: false, foreign_key: true |

### Association
- belongs_to    :user
- belongs_to    :item
- has_one :address

## address テーブル
| Column                | Type       | Options                        |
| --------------------  | ---------- | ------------------------------ |
| order                 | references | null: false, foreign_key: true |
| postcode              | string     | null: false                    | #郵便番号
| prefecture_id         | integer    | null: false                    | #都道府県
| municipalities        | string     | null: false                    | #市町村区
| address               | string     | null: false                    | #番地
| building_name         | string     |                                | #建物名
| phone_number          | string     | null: false                    | #電話番号 

## Association
belongs_to :order

＃都道府県はプルダウン形式で実装