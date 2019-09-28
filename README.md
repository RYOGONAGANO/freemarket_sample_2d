# README

## usersテーブル

|column|type|options|
|------|----|-------|
|nick_name|string|null: false|
|email |text|null: false, unique: true|
|password|string|null: false|

### Assocation
belongs_to :user_detail  
belongs_to :evaluate  
has_many :evaluate_comments  
has_many :seles  
has_many :buyed_products, foreign_key: "buyer_id", class_name: "Product"  
has_many :saling_products, -> { where("buyer_id is NULL") }, foreign_key: "exhibitor_id", class_name: "Product"  
has_many :sold_products, -> { where("buyer_id is not NULL") }, foreign_key: "exhibitor_id", class_name: "Product"  
has_many :nices


## user_detailsテーブル

|column|type|options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_namek|string|null: false|
|last_namek|string|null: false|
|year  |integer|null: false|
|month |integer|null: false|
|day   |integer|null: false|
|sms_phone|string|null: false, unique: true|
|postal_code|string|null: false|
|prefectures|string|null: false|
|city  |string|null: false|
|address|string|null: false|
|building|string|   |
|phone |string|     |
|profile|text|      |
|user|references|null: false, foreign_key: true|

### Assocation
has_one :user, dependent: destroy

## evaluatesテーブル

|column|type|options|
|------|----|-------|
|good  |integer|default: 0|
|normal|integer|default: 0|
|bad   |integer|default: 0|
|user  |references|null: false, foreign_key: true|

### Assocation
has_one :user, dependent: destroy

## evaluate_commentsテーブル

|column|type|options|
|------|----|-------|
|buyer_comment|text| |
|exhibitor_comment|text| |
|buyer|references|null: false, foreign_key: true|
|exhibitor|references|null: false, foreign_key: true|

### Assocation
belongs_to :buyer, class_name: "User"  
belongs_to :exhibitor, class_name: "User"

## salesテーブル

|column|type|options|
|------|----|-------|
|money |integer|default: 0|
|user  |references|null: false, foreign_key: true|

### Assocation
belongs_to :user

## productsテーブル

|column|type|options|
|------|----|-------|
|name  |text|null: false|
|price |integer|null: false|
|description|text|null: false|
|status|string|null: false|
|charge|string|null: false|
|shipping_method|string|null :false|
|shipping_area|string|null: false|
|shipping_date|string|null: false|
|size  |string|     |
|buyer|references|foreign_key: true|
|exhibitor|references|null: false, foreign_key: true|

### Assocation
belongs_to :buyer, class_name: "User"  
belongs_to :exhibitor, class_name: "User"  
belongs_to :category  
belongs_to :brand  
has_many :nices

## nicesテーブル

|column|type|options|
|------|----|-------|
|user  |references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|

### Assocation
belongs_to :user  
belongs_to :product

## categorysテーブル

|column|type|options|
|------|----|-------|
|name  |string|null: false|
|path  |string|     |
|product|references|null: false, foreign_key: true|

### Assocation
has_many :products  
has_many :brands, through: :categorys_brands

## brandsテーブル

|column|type|options|
|------|----|-------|
|name  |string|     |
|product|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|

### Assocation
has_many :products  
has_many :categorys, through: :categorys_brands

## categorys_brandsテーブル

|column|type|options|
|------|----|-------|
|category|references|null: false, foreign_key: true|
|brand |references|null: false, foreign_key: true|

### Assocation
belongs_to :category  
belongs_to :brand