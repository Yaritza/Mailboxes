class Favorite < ActiveRecord::Base
  belongs_to: user
  belongs_to: mailbox
end

  @address_searched = :search
