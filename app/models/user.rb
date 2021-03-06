class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :nickname, presence: true, length: { maximum: 20 }, unless: -> {validation_context == :signin}
  validates :email,    uniqueness: true, unless: -> {validation_context == :signin}
  validates :email,    presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 7, maximum: 128 }

  has_one :card, dependent: :destroy
  has_one :user_detail, dependent: :destroy
  accepts_nested_attributes_for :user_detail
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_one :evaluate
  has_many :evaluate_comments
  has_many :sales
  has_many :products, foreign_key:  "exhibitor_id", dependent: :destroy
  has_many :buyed_products, foreign_key: "buyer_id", class_name: "Product"
  has_many :saling_products, -> { where("buyer_id is NULL") }, foreign_key: "exhibitor_id", class_name: "Product"
  has_many :sold_products, -> { where("buyer_id is not NULL") }, foreign_key: "exhibitor_id", class_name: "Product"
  has_many :likes
  has_many :liked_products, through: :likes, source: :product

end