FactoryBot.define do
  factory :municipe do
    full_name { Faker::JapaneseMedia::OnePiece.character }
    cpf { Faker::IDNumber.brazilian_citizen_number }
    cns { rand.to_s[2..16] }
    email { Faker::Internet.email }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 95).strftime('%d/%m/%Y') }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    photo { Faker::Avatar.image }
    status { Faker::Boolean.boolean }
  end
end
