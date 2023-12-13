# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Creates 200 Municipes
200.times do
  municipe = Municipe.create(
    full_name: Faker::Name.name,
    cpf: Faker::CPF.numeric,
    cns: Faker::Number.number(digits: 15),
    email: Faker::Internet.email,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
    phone: Faker::PhoneNumber.cell_phone,
    status: Faker::Boolean.boolean,
    photo: Faker::Avatar.image
  )
  municipe.create_address(
    zip_code: Faker::Address.zip_code,
    street: Faker::Address.street_name,
    neighborhood: Faker::Address.community,
    city: Faker::Address.city,
    state: Faker::Address.state,
    complement: Faker::Address.secondary_address,
    ibge_code: Faker::Number.number(digits: 7)
  )
end
