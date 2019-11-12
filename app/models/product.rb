class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :exhibitor, class_name: "User"
  belongs_to :category
  belongs_to_active_hash :prefecture
  has_many_attached :images

  enum status: {"新品、未使用": 1, "未使用に近い": 2, "目立った傷や汚れなし": 3,
                "やや傷や汚れあり": 4, "傷や汚れあり": 5, "全体的に状態が悪い": 6}, _suffix: true

  enum fee: {"送料込み(出品者負担)": 1, "着払い(購入者負担)": 2}

  enum shipping_date: {"1~2日で発送": 1, "2~3日で発送": 2, "4~7日で発送": 3}

  enum shipping_method: {未定: 1, らくらくメルカリ便: 2, ゆうメール: 3,
                        レターパック: 4, "普通郵便(定形、定形外)": 5, クロネコヤマト: 6,
                        ゆうパック: 7, クリックポスト: 8, ゆうパケット: 9}

  enum shipping_method1: {未定: 1, らくらくメルカリ便: 2, ゆうメール: 3,
                        レターパック: 4, "普通郵便(定形、定形外)": 5, クロネコヤマト: 6,
                        ゆうパック: 7, クリックポスト: 8, ゆうパケット: 9},_prefix: true

  enum shipping_method2: {未定: 1,  クロネコヤマト: 6 ,ゆうパック: 7, ゆうメール: 3,},_prefix: true

  enum size: {"XXS以下": 1, "XS(SS)": 2, "M": 3, "L": 4,
              "XL(LL)": 5, "2XL(3L)": 6, "3XL(4L)": 7,
              "4XL(5L)以上": 8, "FREE SIZE": 9}



  validates :price, length: { in: 3..7 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, length: { in: 0..40 }
  validates :description, length: { in: 0..999 }
  validates :name, :description, :category, :status, :fee, :shipping_area, :shipping_date, :price, presence: true



  def previous
    products = Product.where(buyer_id: nil)
    products.order(id: "DESC").find_by("id < ?", self.id)
  end

  def next
    products = Product.where(buyer_id: nil)
    products.order(id: "ASC").find_by("id > ?", self.id)
  end
end
