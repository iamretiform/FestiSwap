class Ad < ApplicationRecord
  belongs_to :event
  validates :title, :description, presence: true
end
