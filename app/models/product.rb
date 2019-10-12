class Product < ApplicationRecord
  belongs_to :buyer, class_name: "User"
  belongs_to :exhibitor, class_name: "User"
end
