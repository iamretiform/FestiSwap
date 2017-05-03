class Event < ApplicationRecord
  geocoded_by :address # can also be an IP address
  after_validation :geocode, if: ->(obj) { obj.address.present? && obj.address_changed? }
  belongs_to :user
  has_many :ads
  validates :title, :description, :user_id, :termination_date, presence: true
  has_attached_file :file, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: "/images/:style/missing_2.png"
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/
end
