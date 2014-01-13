# Clears out all mailboxes before runing a rake db:seed
Mailbox.delete_all

puts "Loading mailboxes. This will take a while."

# Calls on Mechanize for the folllowing wed scraping of USPS.com and aquiring their mailbox, a.k.a collection box data.
require 'mechanize'
# Range includes all Manhattan zipcodes. a
nyc_zips =(10001..10292)
#Range is looped into USPS's  URL to scrape for mailbox location/data in each zipcode.
nyc_zips.each do |zip_code|
      a = Mechanize.new { |a| a.user_agent_alias = 'Mac Safari'}
      # Uriginally the Url chosen looked up all mail boxes in 10001. The embeded "10001" in query was replace with string intercalation so each zip in nyc_flash
      #can be looped throught.
      a.get("https://tools.usps.com/go/POLocatorAction!input.action?address=#{zip_code}&radius=1000&locationTypeQ=collectionbox#paginationTop")
      # a is now 'on' that page
      # returns all of the location ids on the page
      a.page.search('#locationID').map(&:text)
      boxes = a.page.search('.result').map do |location|
        #scrapes from different css fields to generate complete mailbox addresses.
        address = "#{location.search('.addressLn').text}, #{location.search('.cityLn').text},#{location.search('.stateLn').text} , #{location.search('.zip-code').text}"
        #scraping for latitude, longitude, and locatiotion ID, is also included in the mailbox model.
        latitude = location.search('div.flag').attr('lat').text
        longitude = location.search('div.flag').attr('lon').text
        #location _id is specific to the USPS database and will be used to identify the uniqueness of the corresponding
        #mailbox in this scrape later.
        location_id = location.search('.location-ID').text
        #creates an empty string called collection_hours so that  pick up days, (eg Mon-Fri) and collection hrs are merged
        # iin the form a single variable.
        collection_hours = ""
        location.search('td.hoursTable_hours ul li').each do |pickup_time|
           collection_hours << "#{pickup_time.search('span.days').text}, #{pickup_time.search('span.hours').text} "
        end
        #Prevents duplicate data on seed file by checking for the uniqueness of location_id before ading a new mailbox.
        Mailbox.find_or_create_by(location_id: location_id) do |m|
            m.address = address
            m.latitude = latitude
            m.longitude = longitude
            m.collection_hours = collection_hours
        end
      end
end

puts "Mailboxes have loaded!"
