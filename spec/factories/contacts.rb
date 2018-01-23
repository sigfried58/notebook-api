FactoryBot.define do
  factory :contact do
    name Faker::Name.name
    email Faker::Internet.email
    birthdate Faker::Date.birthday(18, 65)
    kind
  end
end
