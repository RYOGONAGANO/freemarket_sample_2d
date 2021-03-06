FactoryBot.define do
  factory :user, aliases: [:exhibitor] do
    password = Faker::Internet.password(min_length: 7, max_length: 128)
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {password}
    password_confirmation {password}
  end
end