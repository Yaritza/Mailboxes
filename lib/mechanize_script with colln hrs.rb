####### GET ZIP LIST  FROM http://www.health.ny.gov/statistics/cancer/registry/appendix/neighborhoods.htm and pass them through USPS collection box script
 add to db seeds.


require 'rails'
# make sure you gem install mechanize
require 'mechanize'
# fake it like we're safari
a = Mechanize.new { |a| a.user_agent_alias = 'Mac Safari'}
# look up all mail boxes in 10001. This returns 50 results.
a.get('https://tools.usps.com/go/POLocatorAction!input.action?address=10001&radius=1000&locationTypeQ=collectionbox#paginationTop')
# a is now 'on' that page
# returns all of the location ids on the page
a.page.search('#locationID').map(&:text)
# Gets all 50 boxes on the page and wraps them in an object. 10 to 21 returns an array.
boxes = a.page.search('.result').map do |location|
  address = location.search('.addressLn').text
  city = location.search('.cityLn').text
  state = location.search('.stateLn').text
  zip = location.search('.zip-code').text
  location_id = location.search('.location-ID').text
  phone = location.search('.phoneNum').text
  latitude = location.search('div.flag').attr('lat').text
  longitude = location.search('div.flag').attr('lon').text
  collection_hours = location.search('.hoursTable_hours ul li').collect do |hours|
    {
      hours: hours.search('.hours').text,
      days: hours.search('.days').text
    }
  end
  Mailbox.create!(address: address, city: city, state: state, zip: zip, location_id: location_id, latitude: latitude, longitude: longitude, collection_hours: collection_hours)
end

## extract all the zips from this, and then save to seeds
###http://www.health.ny.gov/statistics/cancer/registry/appendix/neighborhoods.html