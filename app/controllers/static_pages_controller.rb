class StaticPagesController < ApplicationController
  require 'Symphian/soundcloud'
	include Symphian
  def home
  	if signed_in?      
  		@openings = Opening.where(:zip => current_user.zip, :instrument_id => @quack)
  		@listings = Listing.all
      soundcloud = Symphian::Soundcloud.new
  		@player = soundcloud.genre_player(current_user)
  	end
  end

  def about
  end
end
