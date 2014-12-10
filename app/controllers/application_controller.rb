class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private
    def ensure_signed_in
      unless signed_in?
        flash[:danger] = "Please sign in to continue"
        redirect_to signin_url
      end
    end
end
