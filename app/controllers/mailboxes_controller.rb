class MailboxesController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]


    def index
            @query = params[:search]
    end

    def search
            @query = params[:search]
            @address_searched = :search
            @user = :current_sign_in_ip
            @results = Mailbox.near(@query, 15).take(10)
            @markers = Gmaps4rails.build_markers(@results) do |mailbox, marker|
                    marker.lat mailbox.latitude
                    marker.lng mailbox.longitude
                    marker.infowindow mailbox.address
                    #marker.infowindow mailbox.collection_hours
            end
      end

    def create
    end

    def show

    end




end


