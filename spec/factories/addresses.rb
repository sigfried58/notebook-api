FactoryBot.define do
  factory :address do
    street Faker::Address.street_address
    city Faker::Address.city
    contact
  end
end
