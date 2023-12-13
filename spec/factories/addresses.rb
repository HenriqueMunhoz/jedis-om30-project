FactoryBot.define do
  factory :address do
    zip_code { Faker::Address.zip_code }
    street { Faker::Address.street_name }
    complement { Faker::Address.secondary_address }
    neighborhood { Faker::Address.community }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    ibge_code { Faker::Address.building_number }

    municipe
  end
end
