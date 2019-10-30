class Product < ApplicationRecord
  belongs_to :buyer, class_name: "User"
  belongs_to :exhibitor, class_name: "User"

  has_many_attached :images


  def previous
    Product.order(id: "DESC").find_by("id < ?", self.id)
  end

  def next
    Product.order(id: "ASC").find_by("id > ?", self.id)
  end
end
