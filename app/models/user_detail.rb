class UserDetail < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true, length: { maximum:35 }
  validates :last_name,  presence: true, length: { maximum:35 }
  validates :first_name_kata, presence: true
  validates :last_name_kata, presence: true
  #　生年月日のバリデーションよくわからん

  has_one_attached :avatar

  enum birth_year: {
    "--": 0,
    "1": 1
  }
end
