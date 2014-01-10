Geocoder.configure(

  # geocoding service request timeout extended from 3sec  to 5secs in order to avoid "NaN" results on mailbox distance calculations.
  :timeout => 7
