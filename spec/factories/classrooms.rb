FactoryBot.define do
  factory :classroom do
    name { Faker::Educator.course_name }
  end
end
