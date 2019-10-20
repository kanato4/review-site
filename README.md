# README
## userテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false, index: true|
|position|references|null: false, foreign_key: true|

### Association
- has_many :reviews
- belongs_to :position


## positionテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :users


## spotテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|url|string|null: false|

### Association
- has_many :reviews


## reviewテーブル
|Column|Type|Options|
|------|----|-------|
|rate|integer|null: false|
|review|text||
|spot|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :spot
- belongs_to :review