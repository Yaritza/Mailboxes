class Mailbox < ActiveRecord::Base

# Calculates map coordinates of user query for maping
geocoded_by :address
after_validation :geocode

# def self.method_name # Mailbox.method_name
# def method_name # mailbox.method_name

# def self.results(query)
#   near(query, 20).each do |m|
#     mailbox_address = m.address, :order => :distance
#     mailbox_distance = m.distance_from(query).round(2)
#   end
# end

end



#   private

#   def gmaps4rails_address
#     "#{address}, #{self.longitude}, #{self.latitude}"
#   end



#      #  safe_mailbox = params.require(:mailbox).permit(:address, :latitude, :longitude, :collection_day, :collection_time)
#      # @mailboxes.update safe_mailbox

#  # end
