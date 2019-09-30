class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum:20 }
  validates :email,    presence: true
  validates :password, presence: true, length: { minimum:7 , maximum: 128 }


  # def password_complexity
  #   if password.blank? || password =~ /^(?=.*?[a-zA-Z])(?=.*?[0-9]).{7,128}$/
  #   end
  # end


  has_one :user_detail
  has_one :address
  has_one :evaluate
  has_many :evaluate_comments
  has_many :sales
  has_many :products
  has_many :buyed_products, foreign_key: "buyer_id", class_name: "Product"
  has_many :saling_products, -> { where("buyer_id is NULL") }, foreign_key: "exhibitor_id", class_name: "Product"
  has_many :sold_products, -> { where("buyer_id is not NULL") }, foreign_key: "exhibitor_id", class_name: "Product"
  has_many :likes
  has_many :liked_products, through: :likes, source: :product

end

