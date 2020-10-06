FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {Gimei.name.last.kanji}
    first_hurigana        {Gimei.name.last.katakana}
    last_name             {Gimei.name.first.kanji}
    last_hurigana         {Gimei.name.first.katakana}
    birthday              {Faker::Date.birthday}
  end
end