namespace :dev do
  desc "Configura o ambiente de configuracao"
  task setup: :environment do
    puts "resetando o banco de dados"
    %x(rails db:drop db:create db:migrate)

    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    puts "Cadastrando os Tipos contados"
    kinds = %w(Amigo Comercial Conhecido)
    kinds.each { |kind| Kind.create!(description: kind) }
    puts "Tipos Contatos cadastrado com sucesso!"
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    puts "Cadastrando os contados"
    10.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today),
        kind: Kind.all.sample
      )
    end
    puts "Contatos cadastrado com sucesso!"
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    puts "Cadastrando o Telefone os contados"
    Contact.all.each do |contact|
      2.times do |i|
        contact.phones.create!(number: Faker::PhoneNumber.cell_phone)
      end
    end
    puts "Telefone cadastrado com sucesso!"
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    puts "Cadastrando o Enderenço os contados"
    Contact.all.each do |contact|
      address = Address.create(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )
    end
    puts "Enderenço cadastrado com sucesso!"
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
  end
end
