FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    popularity { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    adult { Faker::Boolean.boolean }
    uid { Faker::Number.number(7) }
  end
end