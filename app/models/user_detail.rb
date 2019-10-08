class UserDetail < ApplicationRecord
  belongs_to :user, dependent: destroy

  validates :first_name, presence: true, length: { maximum:35 }
  validates :last_name,  presence: true, length: { maxinum:35 }
  validates :first_name_kana, presence: true
  validates :last_name_kata, presence: true
  #　生年月日のバリデーションよくわからん
  validates :sms_phone, presence: true, uniqueness: true
  validates :postal_code, presence: true

  has_one_attached :avatar
end
