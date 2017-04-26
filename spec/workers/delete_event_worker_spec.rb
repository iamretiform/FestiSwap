require 'rails_helper'
RSpec.describe DeleteEventWorker, type: :worker do
  let(:user) { User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Crypto.sha1) }
  let(:event) { Event.create(title: Faker::HowIMetYourMother.catch_phrase, description: Faker::HowIMetYourMother.quote, termination_date: Faker::Time.forward(1, :morning), user_id: user.id) }

  it 'enqueues delete event at the given termination_date' do
    DeleteEventWorker.perform_at event.termination_date, event.user_id

    expect(DeleteEventWorker).to have_enqueued_sidekiq_job(event.user_id).at(event.termination_date)
  end
end
