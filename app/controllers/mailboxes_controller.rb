class MailboxesController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]


    def index
            @query = params[:search]
            # if @query.empty?
            #     flash[:notice] = "Please enter an address or landmark"
            #     redirect_to root_path
           # end
    end

    def search

            @query = params[:search]
            @address_searched = :search
            @user = :current_sign_in_ip
            #Geocode locates mailboxes within 10 mile radius from user's search "@query" and shows the closest 10 mailboxes.
            @results = Mailbox.near(@query, 10).take(10)
            #Gmaps4rails adds markers to map based on latitude and longitudes extrapolated from the top 10 (closest) mailbox results.
            @markers = Gmaps4rails.build_markers(@results) do |mailbox, marker|
                    marker.lat mailbox.latitude
                    marker.lng mailbox.longitude
                    # This shows a pop-up info window containiing corresponding mailbox's  info when the user clicks a pin on the map.
                    marker.infowindow mailbox.address
                    #mailbox.collection_hours    #<--code does not display in marker on info window

            end
      end

    def create
    end

    def show
    end







end


