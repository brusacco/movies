FactoryBot.define do
  factory :movie do
    adult { false }
    title { Faker::Movie.title }
    popularity { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    uid { Faker::Number.number(digits: 5) }
  end
end
