class Event < ApplicationRecord
  belongs_to :user
  has_many :ads
  validates :title, :description, :user_id, presence: true
end
