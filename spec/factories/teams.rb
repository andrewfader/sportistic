FactoryGirl.define do
  factory :team do
    name Faker::Company.name
    location Faker::Address.city
    captain
  end
end
