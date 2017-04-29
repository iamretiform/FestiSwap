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
      termination_date: Faker::Time.now,
      user_id: user.id
    )
  end

  xit 'DeleteEventWorker deletes an event' do
    DeleteEventWorker.perform_at event.termination_date, event.user_id

    expect(DeleteEventWorker).to have_enqueued_sidekiq_job(event.user_id).at(event.termination_date)
  end
end
