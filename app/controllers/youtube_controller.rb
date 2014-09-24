class YoutubeController < ApplicationController
	def update
		@user = current_user
		@user.youtube.update_attributes(yt_params)
		redirect_to current_user
	end

	private
	def yt_params
		params.require(:youtube).permit(:playlist)
	end
end
