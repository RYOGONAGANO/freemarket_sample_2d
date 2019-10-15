FactoryBot.define do
  factory :user_detail do
    gimei = Gimei.name
    first_name { gimei.last.kanji }
    last_name { gimei.first.kanji }
    first_name_kata { gimei.last.katakana }
    last_name_kata { gimei.first.katakana }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65).to_s(:ja) }
    user
  end
end