FactoryGirl.define do
  factory :user do
    name Faker::Name.first_name
    account Faker::Number.number(5)
    password Faker::Number.number(4)
  end
end
