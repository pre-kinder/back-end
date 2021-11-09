FactoryBot.define do
  factory :attendance do
    child
    classroom
    date { Faker::Date.forward(days: 23) }
    status { ['present', 'absent', 'tardy'].sample }
  end
end
