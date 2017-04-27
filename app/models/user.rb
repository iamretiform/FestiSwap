class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  has_many :events
  has_many :ads
  validates :name, :email, :password, presence: true
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, 
  :default_url => "/images/:style/missing.png",
  :path => "system/users/images/:id/:style/:basename.png",
  :url => "system/users/images/:id/:style/:basename.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
