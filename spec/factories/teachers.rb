FactoryBot.define do
  factory :teacher do
    classroom { nil }
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    address { "MyString" }
    phone_number { "MyString" }
    google_image_url { "MyString" }
    google_id { "MyString" }
  end
end
