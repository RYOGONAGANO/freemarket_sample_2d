class UserDetail < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true, length: { maximum: 35 }
  validates :last_name,  presence: true, length: { maximum: 35 }
  validates :first_name_kata, presence: true, length: { maximum: 35 }, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kata, presence: true, length: { maximum: 35 }, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence:  { message: 'を正しく入力してください' }

  has_one_attached :avatar
end
