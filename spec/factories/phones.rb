FactoryBot.define do
  factory :phone do
    number Faker::PhoneNumber.cell_phone
    contact
  end
end
