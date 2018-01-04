namespace :dev do
  desc 'Set up development environment'
  task setup: :environment do
    puts 'Add types of contacts...'
    kinds = %w(Amigo Comercial Conocido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts 'Types contacts successfully added'

    ###################################

    puts 'Add contacts...'
    100.times do
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.birthday(18, 65),
        kind: Kind.all.sample
      )
    end
    puts 'Contacts successfully added'

    ###################################

    puts 'Add phones...'
    
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        contact.phones.create!(number:  Faker::PhoneNumber.cell_phone)
        contact.save!
      end
    end
    puts 'phones successfully added'
  end
end
