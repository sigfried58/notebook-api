namespace :dev do
  desc 'Set up development environment'
  task setup: :environment do
    puts 'Add contacts...'
    100.times do
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.birthday(18, 65)
      )
    end
    puts 'Contacts successfully added'

    puts 'Add types of contacts...'
    kinds = %w(Amigo Comercial Conocido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts 'Types contacts successfully added'
  end
end
