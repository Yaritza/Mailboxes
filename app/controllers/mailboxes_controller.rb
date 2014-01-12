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
            end
   end

  def create
  end

  def show
  end

end
            #render json: @markers
           #  @hash = Gmaps4rails.build_markers(@mailboxes) do |mailbox, marker|
           #      marker.lat mailbox.latitude
           #      marker.lng mailbox.longitude
           #      marker.infowindow mailbox.address
           #              marker.picture({
           #                         :url => "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
           #                         :width => "50",
           #                         :height => "50"
           #                         })
           # end
         #   render json: @markers
         # end


#render json: @markers





      # raise params[:favorite].inspect
          #this will give you the value of the favorite and will create a ne favorite

        ## adding security
        # safe_favorite = params.require(:favorite).permit(:mailbox_id)
        # favorite = Favorite.create [safe_favorite}
        # redirect_to favorite


 #*********(originally used code is below this point)**********************

### Add collection day and time json to seeds
### Scrape for more seeds###


#     @marker = Gmaps4rails.build_markers(@mailboxes) do |mailbox, marker|
#       marker.lat mailbox.latitude
#       marker.lng mailbox.longitude
#       marker.infowindow mailbox.address

#         # address= mailbox.address,
#         # zip = mailbox.zip,
#         # collection_day =mailbox.collection_day,
#         # collection_time =mailbox.collection_time
#         end

#         if params[:search]
#   @mailboxes = Mailbox.near(params[:search], 20)
#   @json = @mailboxes.to_gmaps4rails
# else
#   @mailboxes = Mailbox.all
#   @json = @mailboxes.to_gmaps4rails
# end

# respond_to do |format|
#   format.html # index.html.erb
#   format.json{ render json: @mailboxes }
#   end
# end
