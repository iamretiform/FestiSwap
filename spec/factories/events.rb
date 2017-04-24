FactoryGirl.define do
  factory :event do
    title         { Faker::Name.name }
    description   { Faker::Address.street_address }
  end
end
