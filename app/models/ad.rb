class Ad < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :title, :description, :user_id, :termination_date, presence: true
end
