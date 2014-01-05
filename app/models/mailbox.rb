class Mailbox < ActiveRecord::Base

  reverse_geocoded_by: latitude, :longitude
  def  nearby_mailboxes
    search_coordinates =  [ ] << Geocoder.coordinates(@search).to_f
    @mailboxes.near( search_coordinates.nearbys(1)) ####
  end

  def distance_from_search_location_to_mailbox (search_coordinates, mailbox)
  end

  def nearby_mailboxes
  end

end
# def lookup

  #     full_street_address = @search.compact.join(', ')

  #     geocoded_by :full_street_address
  #     after_validation :geocode

  # end


# #______________ original code from here own_________
#   serialize :collection_hours, JSON

#   ###missing params?

#   #acts_as_gmappable

#   private

#   def gmaps4rails_address
#     "#{address}, #{self.city}, #{self.state}, #{self.zip}"
#   end



#      #  safe_mailbox = params.require(:mailbox).permit(:address, :city, :state, :zip, :latitude, :longitude, :collection_day, :collection_time)
#      # @mailboxes.update safe_mailbox

#  # end
