class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in?
  	!!current_user
  end

  def current_user
  	@current_user
  end

  def login_as(user)
  	@current_user = user
  	session[:current_user_id] = user.try(:id)
  end
end
