class StaticPagesController < ApplicationController
  def home
  	@user = User.find("1")
  	@favtracks = @user.soundcloud_client.get("/me/tracks", :limit => 5)
  end

  def about
  end
end
