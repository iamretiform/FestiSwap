require 'rails_helper'
RSpec.describe DeleteEventWorker, type: :worker do
  let(:user) { User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Crypto.sha1) }
  let(:event) do
    Event.create(
      title: Faker::HowIMetYourMother.catch_phrase,
      address: Faker::Address.street_address,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
      description: Faker::HowIMetYourMother.quote,
      radius: 1,
      termination_date: Faker::Time.backward(1, :morning),
      user_id: user.id
    )
  end

  xit 'DeleteEventWorker destroys a specific event' do
    expect(event).to be_present
    worker = DeleteEventWorker.new
    worker.perform(event.id)
    expect(event).not_to be_present
  end
end
