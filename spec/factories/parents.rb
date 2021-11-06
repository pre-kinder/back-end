FactoryBot.define do
  factory :parent do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    address { Faker::Address.full_address }
    phone_number { Faker::PhoneNumber.cell_phone }
    google_image_url { Faker::Avatar.image }
    google_id { Faker::Alphanumeric.alphanumeric(number: 21) }
  end
end
