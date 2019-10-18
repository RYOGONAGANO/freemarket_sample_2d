class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :buyer, class_name: "User"
  belongs_to :exhibitor, class_name: "User"
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :product_category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :delivery_fee

end
