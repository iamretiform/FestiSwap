class Event < ApplicationRecord
  belongs_to :user
  has_many :ads
  validates :title, :description, :user_id, :termination_date, presence: true
  has_attached_file :file, styles: { medium: "300x300>", thumb: "100x100>" }, 
  :default_url => "/images/:style/missing_2.png",
  :path => "system/events/images/:id/:style/:basename.png",
  :url => "system/events/images/:id/:style/:basename.png"
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/
end
