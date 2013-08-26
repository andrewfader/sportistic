FactoryGirl.define do
  factory :user, aliases: [:captain] do
    sequence :email do |n|
      "n#{Faker::Internet.email}"
    end
    password 'foobar'
    password_confirmation 'foobar'
    name Faker::Name.name
    city Faker::Address.city
    state Faker::Address.us_state
    gender 'Male'
  end
end
