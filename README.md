# テーブル設計

## users テーブル
| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| nickname           | string     | null: false | #ユーザー名
| email              | string     | null: false | #メールアドレス
| encrypted_password | string     | null: false | #パスワード
| name               | string     | null: false | #本名(漢字)
| name_kana          | string     | null: false | #本名(カタカナ) 
| birthday           | date       | null: false | #生年月日

### Association
- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル
| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| item-name          | string  | null: false | #商品名
| item-text          | text    | null: false | #商品説明
| price              | integer | null: false | #値段
| category_id        | integer | null: false | #商品カテゴリー
| item-condition_id  | integer | null: false | #商品状態
| delivery-fee_id    | integer | null: false | #送料の有無
| shipment-source_id | integer | null: false | #発送元
| delivery-days_id   | integer | null: false | #発送日の目安

### Association
- belongs to :user
- has_one    :purchase

＃商品カテゴリー、商品状態、送料の有無、発送元、発送日の目安はプルダウン形式で実装

## comments テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

- belongs to    :user
- belongs to    :item

## purchase テーブル
| Column                | Type       | Options                        |
| --------------------  | ---------- | ------------------------------ |
| user                  | references | null: false, foreign_key: true |
| item                  | references | null: false, foreign_key: true |
| post-number           | integer    | null: false | #郵便番号
| prefecture_id         | integer    | null: false | #都道府県
| municipalities        | string     | null: false | #市町村区
| address               | string     | null: false | #番地
| building-name         | string     |             | #建物名
| phone-number          | integer    | null: false | #電話番号 
| card-number           | integer    | null: false | #クレジットカード番号
| card-date-of-expiry   | integer    | null: false | #有効期限
| card-cvc              | integer    | null: false | #セキュリティコード

### Association
- belongs to    :user
- belongs to    :item

＃都道府県はプルダウン形式で実装
