# README

## usersテーブル

|column|type|options|
|------|----|-------|
|nickname|string|null: false|
|email |text|null: false, unique: true|
|password|string|null: false|

### Assocation
has_one :user_detail, dependent: :destroy  
accepts_nested_attributes_for :user_detail  
has_one :address, dependent: :destroy  
accepts_nested_attributes_for :address  
has_one :evaluate  
has_many :evaluate_comments  
has_many :sales  
has_many :products  
has_many :buyed_products, foreign_key: "buyer_id", class_name: "Product"  
has_many :saling_products, -> { where("buyer_id is NULL") }, foreign_key: "exhibitor_id", class_name: "Product"  
has_many :sold_products, -> { where("buyer_id is not NULL") }, foreign_key: "exhibitor_id", class_name: "Product"  
has_many :likes  
has_many :liked_products, through: :likes, source: :product


## user_detailsテーブル

|column|type|options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kata|string|null: false|
|last_name_kata|string|null: false|
|birth_year  |integer|null: false|
|birth_month |integer|null: false|
|birth_day   |integer|null: false|
|sms_phone|string|  |
|phone |string|     |
|profile|text|      |
|user|references|null: false, foreign_key: true|

### Assocation
belongs_to :user

## addressesテーブル

|column|type|options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture_id|integer|null: false, default: "0"|
|city  |string|null: false|
|address|string|null: false|
|building|string|   |
|user  |reference|null: false, foreign_key: true|

### Assocation
belongs_to :user  
belongs_to_active_hash :prefecture

## evaluatesテーブル

|column|type|options|
|------|----|-------|
|buyer_evaluate|integer|null: false|
|exhibitor_evaluate|integer|null: false|
|buyer|references|null: false, foreign_key: true|
|exhibitor|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|

### Assocation
belongs_to :buyer, class_name: "User"  
belongs_to :exhibitor, class_name: "User"  
belongs_to :product

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
|price |integer|default: 0|
|user  |references|null: false, foreign_key: true|

### Assocation
belongs_to :user

## productsテーブル

|column|type|options|
|------|----|-------|
|name  |text|null: false|
|price |integer|null: false|
|description|text|null: false|
|status|integer|null: false|
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
has_many :likes  
has_many :liked_users, through: :likes, source: :user  
has_one :evaluate

## likesテーブル

|column|type|options|
|------|----|-------|
|user  |references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|

### Assocation
belongs_to :user  
belongs_to :product, dependent: destroy

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