class Favorite < ActiveRecord::Base
  belongs_to: user
  belongs_to: mailbox
end


 # belongs_to
 # has_many
 # has_many :through