class Event < ApplicationRecord
  belongs_to :user
  has_many :ads
  validates :title, :description, :user_id, :termination_date, presence: true
end
