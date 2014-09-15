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

	def sc_connect_link
		link_to image_tag("btn-connect-sc-m.png", :border => 0, 
																							:alt => "Connect With SoundCloud"),
						soundcloud_connect_path, 
						:class => "connect"
	end
end