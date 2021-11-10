FactoryBot.define do
  factory :child do
    association :parent, factory: :parent
    association :classroom, factory: :classroom
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthday { Faker::Date.birthday(min_age: 3, max_age: 5) }
  end
end
