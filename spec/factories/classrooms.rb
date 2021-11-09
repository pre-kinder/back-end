FactoryBot.define do
  factory :classroom do
    name { Faker::Games::Pokemon.location }

    trait :with_teachers do
      after :create do |classroom|
        create_list(:teacher, 3, classroom: classroom)
      end
    end
  end
end
