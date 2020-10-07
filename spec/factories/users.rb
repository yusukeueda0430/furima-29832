FactoryBot.define do
  factory :user do
    first_name            {"上田"}
    first_hurigana        {"ウエダ"}
    last_name             {"裕介"}
    last_hurigana         {"ユウスケ"}
    nickname              {Faker::Internet.username }
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday              {Faker::Date.birthday}
  end
end