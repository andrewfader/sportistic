FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "n#{Faker::Internet.email}"
    end
    password 'foobar'
    password_confirmation 'foobar'
    fullname Faker::Name.name
    sports 'Baseball'
    city 'Footown'
    gender 'Male'
  end
end
