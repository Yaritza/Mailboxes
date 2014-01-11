class Mailbox < ActiveRecord::Base

# Calculates map coordinates of user query for maping
geocoded_by :address
after_validation :geocode

end



#   private

#   def gmaps4rails_address
#     "#{address}, #{self.longitude}, #{self.latitude}"
#   end



#      #  safe_mailbox = params.require(:mailbox).permit(:address, :latitude, :longitude, :collection_day, :collection_time)
#      # @mailboxes.update safe_mailbox

#  # end
