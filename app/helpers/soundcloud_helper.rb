module SoundcloudHelper
	def sc_current_user
		@current_user
	end

	def sc_logged_in?
		!!current_user
	end
end