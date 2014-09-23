class StaticPagesController < ApplicationController
  def home
  	if signed_in?
  		@openings = Opening.where(:zip => current_user.zip, :instrument_id => @quack)
  	end
  end

  def about
  end
end
