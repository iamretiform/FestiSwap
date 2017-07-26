class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  geocoded_by :address # can also be an IP address
  after_validation :geocode, if: ->(obj) { obj.address.present? && obj.address_changed? }
  belongs_to :user
  has_many :ads
  validates :title, :description, :user_id, :start_date, :termination_date, presence: true
  has_attached_file :file, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing_2.png'
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/
  has_attached_file :theme_song
  validates_attachment_content_type :theme_song, :content_type => [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]
end
