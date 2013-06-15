class ApplicationController < ActionController::Base
  protect_from_forgery
  # before_filter :after_token_authentication 
  before_filter :authenticate_user!

  # it is empty hook provided by devise i,e once user is successfully authenticated with the token devise look for this method ,and execute the code there

  # def after_token_authentication
    # if params[:authentication_key].present?
      # @user = User.find_by_authentication_token(params[:authentication_key]) 
      # # we are finding the user with the authentication_key with which devise has authenticated the user
      # sign_in @user if @user 
      # # we are siging in user if it exist. sign_in is devise method  to sigin in any user
      # redirect_to root_path # now we are redirecting the user to root_path i,e our home page
    # end
  # end
end
