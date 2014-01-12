class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  geocoded_by :current_sign_in_ip #added reference for a post-BEWD (upcoming) feature.

  after_validation :geocode
  has_many :favorites
  has_many :mailboxes, through: :favorites

end

