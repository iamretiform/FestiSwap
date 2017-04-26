class DeleteEventWorker
  include Sidekiq::Worker

  def perform(event_id)
    Event.where(id: event_id).first.destroy
  end
end
