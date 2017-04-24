class Event < ApplicationRecord
  validates :title, :description, presence: true
  has_many :ads
end
