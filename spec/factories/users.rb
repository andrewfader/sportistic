# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |u|
    u.email 'foobar@bar.com'
    u.password 'foobar'
    u.password_confirmation 'foobar'
    u.fullname 'Foo Bar'
    u.sports 'Baseball'
    u.city 'Footown'
    u.gender 'male'
  end
end
