FactoryBot.define do
  factory :event do
    classroom
    title { Faker::Lorem.words }
    description { Faker::Lorem.paragraphs(number: 1)}
    date { Faker::Date.in_date_period }
    time { Faker::Time.forward(days: 5,  period: :evening, format: :long) }
  end
end
