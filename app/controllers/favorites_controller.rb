class FavoritesController < ApplicationController
before_filter :authenticate_user!
  def create
    @favorite = Favorite.create safe_favorite
    redirect_to favorites_path
  end

  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

   private

   def  safe_favorite
      params.permit(:mailbox_id, :address_searched, :user_id)
   end

end
