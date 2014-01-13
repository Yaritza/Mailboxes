##To add collection days and times to this file
Mailbox.delete_all

# make sure you gem install mechanize
require 'mechanize'
# fake it like we're safari
nyc_zips =(10001..10292)

nyc_zips.each do |zip_code|
      a = Mechanize.new { |a| a.user_agent_alias = 'Mac Safari'}
      # look up all mail boxes in 10001. This returns 50 results.
      a.get("https://tools.usps.com/go/POLocatorAction!input.action?address=#{zip_code}&radius=1000&locationTypeQ=collectionbox#paginationTop")
      # a is now 'on' that page
      # returns all of the location ids on the page
      a.page.search('#locationID').map(&:text)

      boxes = a.page.search('.result').map do |location|
        address = "#{location.search('.addressLn').text}, #{location.search('.cityLn').text},#{location.search('.stateLn').text} , #{location.search('.zip-code').text}"
        latitude = location.search('div.flag').attr('lat').text
        longitude = location.search('div.flag').attr('lon').text
        location_id = location.search('.location-ID').text
        collection_hours = ""
        location.search('td.hoursTable_hours ul li').each do |pickup_time|
           collection_hours << "#{pickup_time.search('span.days').text}, #{pickup_time.search('span.hours').text} "
        end
        Mailbox.find_or_create_by(location_id: location_id) do |m|
            m.address = address
            m.latitude = latitude
            m.longitude = longitude
            m.collection_hours = collection_hours
        end
      end
end


# Mailbox.create(address: '1000 6TH AVE, NEW YORK, NY, 10018',  latitude: 40.75180925096071, longitude: -73.98631796005327)
# Mailbox.create(address: '1119 BROADWAY, NEW YORK, NY, 10010',  latitude: 40.7430459348959, longitude: -73.98921536508992)
# Mailbox.create(address: '1119 BROADWAY, NEW YORK, NY, 10010',  latitude: 40.7430459348959, longitude: -73.98921536508992)
# Mailbox.create(address: '1141 BROADWAY, NEW YORK, NY, 10001',  latitude: 40.74399462403791, longitude: -73.98898434956038)
# Mailbox.create(address: '1203 BROADWAY, NEW YORK, NY, 10001',  latitude: 40.74614542627047, longitude: -73.98866816739816)
# Mailbox.create(address: '1231 BROADWAY, NEW YORK, NY, 10001',  latitude: 40.746823593109816, longitude: -73.98852300966227)
# Mailbox.create(address: '1255 BROADWAY, NEW YORK, NY, 10001',  latitude: 40.747828594043476, longitude: -73.98826156163275)
# Mailbox.create(address: '1273 BROADWAY, NEW YORK, NY, 10001',  latitude: 40.74819862643015, longitude: -73.9882635699849)
# Mailbox.create(address: '135 W 23RD ST, NEW YORK, NY, 10011',  latitude: 40.74337561300047, longitude: -73.99378495899964)
# Mailbox.create(address: '1373 BROADWAY, NEW YORK, NY, 10018',  latitude: 40.75233037559736, longitude: -73.98753303123125)
# Mailbox.create(address: '1393 BROADWAY, NEW YORK, NY, 10018',  latitude: 40.75276788504335, longitude: -73.98742037909845)
# Mailbox.create(address: '2 PENN PLZ, NEW YORK, NY, 10001',  latitude: 40.749653440000486, longitude: -73.99167557099963)
# Mailbox.create(address: '2 PENN PLZ, NEW YORK, NY, 10001',  latitude: 40.749653440000486, longitude: -73.99167557099963)
# Mailbox.create(address: '208 7TH AVE, NEW YORK, NY, 10011',  latitude: 40.74370023333958, longitude: -73.99600057718811)
# Mailbox.create(address: '221 W 38TH ST, NEW YORK, NY, 10018',  latitude: 40.75387588027257, longitude: -73.98961368372976)
# Mailbox.create(address: '222 7TH AVE, NEW YORK, NY, 10011',  latitude: 40.7441064840005, longitude: -73.99572477499964)
# Mailbox.create(address: '222 7TH AVE, NEW YORK, NY, 10011',  latitude: 40.74410568575159, longitude: -73.99570449022934)
# Mailbox.create(address: '227 W 27TH ST, NEW YORK, NY, 10001',  latitude: 40.74700041575072, longitude: -73.9945719676535)
# Mailbox.create(address: '248 5TH AVE, NEW YORK, NY, 10001',  latitude: 40.744687105693586, longitude: -73.98737323019203)
# Mailbox.create(address: '256 8TH AVE, NEW YORK, NY, 10011',  latitude: 40.74525251238349, longitude: -73.99843600383566)
# Mailbox.create(address: '265 5TH AVE, NEW YORK, NY, 10016',  latitude: 40.74523529181048, longitude: -73.98677990304382)
# Mailbox.create(address: '278 8TH AVE, NEW YORK, NY, 10011',  latitude: 40.745907460339, longitude: -73.99793758774891)
# Mailbox.create(address: '281 7TH AVE, NEW YORK, NY, 10001',  latitude: 40.74596302191584, longitude: -73.99421626469233)
# Mailbox.create(address: '299 8TH AVE, NEW YORK, NY, 10001',  latitude: 40.746582008670266, longitude: -73.9976118299511)
# Mailbox.create(address: '305 7TH AVE, NEW YORK, NY, 10001',  latitude: 40.74679110000045, longitude: -73.99364437199966)
# Mailbox.create(address: '305 7TH AVE, NEW YORK, NY, 10001',  latitude: 40.74679110000045, longitude: -73.99364437199966)
# Mailbox.create(address: '318 5TH AVE, NEW YORK, NY, 10001',  latitude: 40.74714279572243, longitude: -73.98557374417318)
# Mailbox.create(address: '318 5TH AVE, NEW YORK, NY, 10001',  latitude: 40.74714279572243, longitude: -73.98557374417318)
# Mailbox.create(address: '321 8TH AVE, NEW YORK, NY, 10001',  latitude: 40.74721857998529, longitude: -73.99716628558681)
# Mailbox.create(address: '333 7TH AVE, NEW YORK, NY, 10001',  latitude: 40.74755199700047, longitude: -73.99309432599966)
# Mailbox.create(address: '361 7TH AVE, NEW YORK, NY, 10001',  latitude: 40.74847927142997, longitude: -73.99237898925676)
# Mailbox.create(address: '383 8TH AVE, NEW YORK, NY, 10001',  latitude: 40.74916060583807, longitude: -73.9956526892461)
# Mailbox.create(address: '39 W 31ST ST, NEW YORK, NY, 10001',  latitude: 40.74730336026302, longitude: -73.98774460856507)
# Mailbox.create(address: '401 7TH AVE, NEW YORK, NY, 10001',  latitude: 40.75012353443558, longitude: -73.99124971597836)
# Mailbox.create(address: '412 9TH AVE, NEW YORK, NY, 10001',  latitude: 40.7529665087812, longitude: -73.99653958282374)
# Mailbox.create(address: '421 8TH AVE, NEW YORK, NY, 10001',  latitude: 40.75033727100748, longitude: -73.99488666706046)
# Mailbox.create(address: '440 7TH AVE, NEW YORK, NY, 10001',  latitude: 40.75097844300046, longitude: -73.99054688799964)
# Mailbox.create(address: '463 7TH AVE, NEW YORK, NY, 10001',  latitude: 40.751861835000454, longitude: -73.98995448099964)
# Mailbox.create(address: '47 W 34TH ST, NEW YORK, NY, 10001',  latitude: 40.74986158774485, longitude: -73.98776944475571)
# Mailbox.create(address: '481 8TH AVE, NEW YORK, NY, 10001',  latitude: 40.75253795368315, longitude: -73.99321697673716)
# Mailbox.create(address: '500 8TH AVE, NEW YORK, NY, 10001',  latitude: 40.75315215100045, longitude: -73.99272419099964)
# Mailbox.create(address: '540 8TH AVE, NEW YORK, NY, 10018',  latitude: 40.754282818156526, longitude: -73.99195357656254)
# Mailbox.create(address: '71 W 23RD ST, NEW YORK, NY, 10010',  latitude: 40.74254222600047, longitude: -73.99180673599966)
# Mailbox.create(address: '71 W 23RD ST, NEW YORK, NY, 10010',  latitude: 40.74254222600047, longitude: -73.99180673599966)
# Mailbox.create(address: '734 6TH AVE, NEW YORK, NY, 10010',  latitude: 40.74356528800047, longitude: -73.99224274799963)
# Mailbox.create(address: '775 6TH AVE, NEW YORK, NY, 10001',  latitude: 40.7448771114258, longitude: -73.99135499932623)
# Mailbox.create(address: '793 6TH AVE, NEW YORK, NY, 10001',  latitude: 40.74530534257113, longitude: -73.99105216183119)
# Mailbox.create(address: '875 6TH AVE, NEW YORK, NY, 10001',  latitude: 40.748149175923, longitude: -73.98898908139624)
# Mailbox.create(address: '960 6TH AVE, NEW YORK, NY, 10001',  latitude: 40.750589620267796, longitude: -73.98721464294874)
# Mailbox.create(address: '960 6TH AVE, NEW YORK, NY, 10001',  latitude: 40.750589620267796, longitude: -73.98721464294874)


puts "Mailboxes have loaded"
  ##To add collection days and times to this file