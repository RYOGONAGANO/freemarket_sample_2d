FactoryBot.define do
  factory :product do
    name                { Faker::Commerce.product_name  }
    price               { Faker::Number.between(from: 100, to: 9999999) }
    description         { Faker::Lorem.paragraph(50) }
    status              { Faker::Number.between(from: 1, to: 6) }
    fee                 { Faker::Number.between(from: 1, to: 2) }
    shipping_method     { Faker::Number.between(from: 1, to: 9) }
    shipping_area       { Faker::Number.between(from: 1, to: 47) }
    shipping_date       { Faker::Number.between(from: 1, to: 3) }
    association :category, factory: :category, id: Faker::Number.between(from: 33, to: 200)
    association :exhibitor, factory: :user
  end
end