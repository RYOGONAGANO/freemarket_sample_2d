class Address < ApplicationRecord
  belongs_to :user

  validates :prefectures, presence: true
  validates :city, presence: true
  validates :address, precence: true
end
