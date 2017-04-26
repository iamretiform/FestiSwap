FactoryGirl.define do
  factory :ad do
    title         { Faker::Name.name }
    description   { Faker::Address.street_address }
    user_id       { FactoryGirl.create(:user).id }
    event_id      { FactoryGirl.create(:event).id }
    termination_date   { Faker::Time.forward(1, :morning)}
  end
end
