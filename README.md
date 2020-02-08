# README
## userテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false, index: true|
|telephone|integer||
|birthday|date|null: false|
|gender|integer|null; false|

### Association
- has_many :reviews
- has_one :position
- has_one :gender


## positionテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|position|string|null: false|

### Association
- belongs_to :user


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