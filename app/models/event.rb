class Event < ApplicationRecord
  has_many :ads
  validates :title, :description, :presence => true
end
