FactoryBot.define do
  factory :food do
    title       {Faker::Name.initials(number: 4)}
    image       {Faker::Lorem.sentence}
    price       { 400 }
    association :user
  end
end
