namespace :dev do
  desc "Configura o ambiente de configuracao"
  task setup: :environment do
    10.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today)
      )
    end
  end
end
