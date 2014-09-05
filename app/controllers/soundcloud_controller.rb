class SoundcloudController < ApplicationController
	#Client ID: e4766e375be7af45b4943567c94f0206
	#Client Secret: fa58decf55d7638e3867e7bbab300887
	#End User Auth: https://soundcloud.com/connect
	#Token: https://api.soundcloud.com/oauth2/token
	include SoundcloudHelper
	

	def connect
		redirect_to soundcloud_client.authorize_url(:display => "popup")
	end

	def connected
		if params[:error].nil?
			soundcloud_client.exchange_token(:code => params[:code])
			me = soundcloud_client.get("/me")

			#If I actually want to use SoundCloud login as Symphian Login

			sc_login_as(current_user)

			#For future "soundcloud-only" login
			#sc_login_as User.find_or_create_by_soundcloud_user_id({
			#	:soundcloud_user_id => me.id,
			#	:soundcloud_username => me.username,
			#})

			current_user.update_attributes!({
				:soundcloud_user_id => me.id,
				:soundcloud_username => me.permalink,
			})

			current_user.update_attributes!({
				:soundcloud_access_token => soundcloud_client.access_token,
				:soundcloud_refresh_token => soundcloud_client.refresh_token,
				:soundcloud_expires_at => soundcloud_client.expires_at,
			})			
		end
		redirect_to current_user
	end

	def disconnect
		sc_login_as(nil)
		redirect_to current_user
	end

	private
		def soundcloud_client
			return @soundcloud_client ||= User.soundcloud_client(:redirect_uri => soundcloud_connected_url)
		end
end