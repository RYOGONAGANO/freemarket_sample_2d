class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :buyer, class_name: "User"
  belongs_to :exhibitor, class_name: "User"
  belongs_to :category
  belongs_to_active_hash :prefecture

  enum status: {新品、未使用: 1, 未使用に近い: 2, 目立った傷や汚れなし: 3,
                やや傷や汚れあり: 4, 傷や汚れあり: 5, 全体的に状態が悪い: 6}

  enum fee: {"送料込み(出品者負担)": 1, "着払い(購入者負担)": 2}

  enum shippingday: {"1~2日で発送": 1, "2~3日で発送": 2, "4~7日で発送": 3}

  enum shippingmethod1: {未定: 1, らくらくメルカリ便: 2, ゆうメール: 3,
                        レターパック: 4, "普通郵便(定形、定形外)": 5, クロネコヤマト: 6,
                        ゆうパック: 7, クリックポスト: 8, ゆうパケット: 9},_prefix: true

  enum shippingmethod2: {未定: 1,  クロネコヤマト: 6 ,ゆうパック: 7, ゆうメール: 3,},_prefix: true

  enum size: {"XXS以下": 1, "XS(SS)": 2, "M": 3, "L": 4,
              "XL(LL)": 5, "2XL(3L)": 6, "3XL(4L)": 7, 
              "4XL(5L)以上": 8, "FREE SIZE": 9}



  validates :price, length: { in: 3..7 }
  validates :name, length: { in: 0..40 }
  validates :description, length: { in: 0..999 }
  validates :image, :name, :description, :category, :status, :charge, :shipping_area, :shipping_date, :price, presence: true
end
