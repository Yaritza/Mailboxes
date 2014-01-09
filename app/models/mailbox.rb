class Mailbox < ActiveRecord::Base


geocoded_by :address
after_validation :geocode

end


# geocoded_by :address
# after_validation :geocode, :if => :has_location, :unless => :has_coordinates

# end

# geocoded_by :full_street_address   # can also be an IP address
# after_validation :geocode          # auto-fetch coordinates

# end

#   private

#   def gmaps4rails_address
#     "#{address}, #{self.city}, #{self.state}, #{self.zip}"
#   end



#      #  safe_mailbox = params.require(:mailbox).permit(:address, :latitude, :longitude, :collection_day, :collection_time)
#      # @mailboxes.update safe_mailbox

#  # end
