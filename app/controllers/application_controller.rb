class ApplicationController < ActionController::Base
  def create
    User.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:ip_address)
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
