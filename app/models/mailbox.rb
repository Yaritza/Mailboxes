class Mailbox < ActiveRecord::Base

# Calculates map coordinates of user query for maping
geocoded_by :address
after_validation :geocode

end

