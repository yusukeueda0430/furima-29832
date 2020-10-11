FactoryBot.define do
  factory :product do
    name {"上田"}
    details{"きれいです"}
    category_id{2}
    status_id{2}
    fee_id{2}
    consider_id{2}
    days_id{2}
    price{300}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
