class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


# next few lines added directly from: http://www.rubygeocoder.com/
  geocoded_by :current_sign_in_ip
  after_validation :geocode
  has_many :stories

end

