class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :omniauthable, omniauth_providers: %i[google_oauth2 facebook]
  has_many :events
  has_many :ads
  validates :name, :email, presence: true
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
    if user
      return user
    else
      user = User.create!(
        name: auth.info.name,
        provider: auth.provider,
        uid: auth.uid,
        email: auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
      if auth.info.image.present?
        avatar_url = process_uri(auth.info.image)
        user.update_attribute(:avatar, URI.parse(avatar_url))
        return user
      end
    end
  end

  private

  def self.process_uri(uri)
    require 'open-uri'
    require 'open_uri_redirections'
    open(uri, allow_redirections: :safe) do |r|
      r.base_uri.to_s
    end
  end
end
