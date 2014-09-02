class SoundcloudController < ApplicationController
	#Client ID: e4766e375be7af45b4943567c94f0206
	#Client Secret: fa58decf55d7638e3867e7bbab300887
	#End User Auth: https://soundcloud.com/connect
	#Token: https://api.soundcloud.com/oauth2/token

	def connect
		redirect_to soundcloud_client.authorize_url(:display => "popup")
	end

	def connected
	end

	def disconnect
	end

	private
		def soundcloud_client
			return @soundcloud_client ||= User.soundcloud_client(:redirect_uri => soundcloud_connected_url)
		end
end