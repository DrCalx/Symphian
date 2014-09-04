module SoundcloudHelper
	def sc_current_user
		@sc_current_user
	end

	def sc_logged_in?
		!!sc_current_user
		return true
	end

	def sc_login_as(user)
		puts "11111111111111111111111111111111111111111111111111111"
  	@sc_current_user = user
  	session[:current_user_id] = user.try(:id)
  end
end