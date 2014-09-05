module SoundcloudHelper
	def sc_login_as(user)
		session[:current_user_id] = user.try(:id)
	end

	#For future "soundcloud-only" login
	def sc_login_from_session
		@current_user = User.find_by(:id, session[:current_user_id])
	end

	def sc_logged_in?
		!!session[:current_user_id]
	end
end