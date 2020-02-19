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
- has_many :comments


## reviewテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|description|text|null: false|
|rating|float|null: false|
|user_id|references|foreign_key: true, null: false|

### Association
- belongs_to :users
- has_many :comments
- has_many :reviews_tags
- has_many :tags,  through:  :reviews_tags


## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|prefecture|integer|null: false|
|city|string||
### Association
- has_many :reviews_tags
- has_many :reviews,  through:  :reviews_tags


## reviews_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :review
- belongs_to :tag


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :review
- belongs_to :user