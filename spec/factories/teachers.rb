FactoryBot.define do
  factory :teacher do
    classroom
    first_name { Faker::Artist.name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    address { Faker::Address.full_address }
    phone_number { Faker::PhoneNumber }
    google_image_url { Faker::LoremFlickr.image }
    google_id { Faker::Internet.username(specifier: 5..8) }
  end
end
