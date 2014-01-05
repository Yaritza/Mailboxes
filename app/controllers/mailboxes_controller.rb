class MailboxesController < ApplicationController

before_action :authenticate_user!, only: [:new, :create]


  def index
    # @current_location = request.ip
    # @query = params['query']
    #@mailboxes = Mailbox.where('zip LIKE :query OR address LIKE :query', query: "%#{query}%")
    #Not a real search !! narrow search by proximity, or by proximity and collection times!!
  end

      def search
        binding.pry
      end

  def show
    @mailboxes =  Mailbox.find params[:id]
  end
end

 #*********(originally used code is below this point)**********************
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
