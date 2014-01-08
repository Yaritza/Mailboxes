# class Mailbox < ActiveRecord::Base

# geocoded_by :address
# after_validation :reverse_geocode, :if => :has_coordinates    #overrides coordinates that do not have known location addresses associated with them.
# after_validation :geocode, :if => :has_location, :unless => :has_coordinates

# end


class Mailbox < ActiveRecord::Base

geocoded_by :address
after_validation :geocode, :if => :has_location, :unless => :has_coordinates

end





#   private

#   def gmaps4rails_address
#     "#{address}, #{self.city}, #{self.state}, #{self.zip}"
#   end



#      #  safe_mailbox = params.require(:mailbox).permit(:address, :latitude, :longitude, :collection_day, :collection_time)
#      # @mailboxes.update safe_mailbox

#  # end
