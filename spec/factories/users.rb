FactoryGirl.define do
  factory :user, aliases: [:captain] do
    sequence :email do |n|
      "n#{Faker::Internet.email}"
    end
    password 'foobar'
    password_confirmation 'foobar'
    name Faker::Name.name
    sports ['Baseball']
    city Faker::Address.city
    gender 'Male'
  end
end
