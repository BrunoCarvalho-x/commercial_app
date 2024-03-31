FactoryBot.define do
  factory :order do
    client_name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    delivery_date { Faker::Date.forward(days: 30) }
    delivery_hour { Faker::Time.forward(days: 5, period: :evening).strftime('%H:%M') }
    value { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
  end
end
