## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|null: false,add_index|
|image|string| |
|group_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false,index: true, unique: true|
|e-mail|string|null: false, unique: true|

### Association
- has_many :messages
- has_many :groups, through: :members
- has_many :members


## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique :true|

### Association
- has_many :massages
- has_many :users, through: :members
- has_many :members

## membersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group




