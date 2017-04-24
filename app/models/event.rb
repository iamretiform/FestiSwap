class Event < ApplicationRecord
  validates_presence_of :title, :description
  has_many :ads
  validates :title, :description, :presence => true
end
