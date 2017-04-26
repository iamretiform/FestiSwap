FactoryGirl.define do
  factory :event do
    title              { Faker::Name.name }
    description        { Faker::Address.street_address }
    user_id            { FactoryGirl.create(:user).id }
    termination_date   { Faker::Time.forward(1, :morning)}
  end
end
