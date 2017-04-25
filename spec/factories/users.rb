FactoryGirl.define do
  factory :user do
    name         { Faker::Name.name }
    email        { Faker::Internet.email }
    password     { Faker::Crypto.sha1 }
  end
end
