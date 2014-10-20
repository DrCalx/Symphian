class StaticPagesController < ApplicationController
	include Symphian
  def home
  	if signed_in?
  		@openings = Opening.where(:zip => current_user.zip, :instrument_id => @quack)
  		@listings = Listing.all
  		#require 'pry';binding.pry
  		@player = Symphian::Soundcloud.new.genre_player(current_user)
  	end
  end

  def about
  end
end
