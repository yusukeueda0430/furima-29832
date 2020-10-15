FactoryBot.define do
  factory :order_address do
    token { "tok_abcdefghijk00000000000000000" }
    postal { '111-1111' }
    consider_id { 2 }
    municipality { "大阪" }
    address { '1-1-2' }
    building_name { "ビル" }
    phone_number { 55566668888 }
    # association :user
    # association :product
  end
end
