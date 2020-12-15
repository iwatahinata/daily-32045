FactoryBot.define do
  factory :address_order do
    postal_code    {'333-9999'}
    city           {'名古屋市守山区'}
    street         {'2-2-2'}
    house_name     {'森ハイツ'}
    phone_number   {'09012345678'}
    food_id        {'1'}
    user_id        {'1'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
