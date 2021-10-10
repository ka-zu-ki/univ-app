FactoryBot.define do
  factory :lesson do
    name { Faker::Lorem.characters(number: 5) }
    professor { Faker::Lorem.characters(number: 5) }
    week { Faker::Lorem.characters(number: 3) }
    time { Faker::Lorem.characters(number: 30) }
    room { Faker::Lorem.characters(number: 30) }
    content { Faker::Lorem.characters(number: 30) }
  end
end
