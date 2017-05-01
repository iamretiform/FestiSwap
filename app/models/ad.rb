class Ad < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :title, :description, :user_id, :termination_date, presence: true
  has_attached_file :file, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/
end
