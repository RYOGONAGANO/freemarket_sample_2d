FactoryBot.define do
  factory :address do
  postal_code   { Faker::Address.postcode }
  prefecture_id { Faker::Number.between(from: 1, to: 47) }
  city          { Faker::Address.city }
  address       { Faker::Address.street_address }
  user
  end
end