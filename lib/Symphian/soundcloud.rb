module Symphian
	class Soundcloud
		def genre_player(user)
			genre_names = user.genres.map{|n| n.name}.join(', ').downcase

			embed = user.soundcloud_client.get('/oembed', 
											:url => "http://soundcloud.com/#{user.soundcloud_username}/tracks", 
											:maxheight => 450)		
			#tracks = user.soundcloud_client.get('/tracks',  :genres => "rock")
			#url = tracks.shuffle.first.permalink_url

			#embed = user.soundcloud_client.get('/oembed', :url => "http://soundcloud.com/#{soundcloud_username}/tracks", :maxheight => 166)

			embed['html'].html_safe
		end
	end
end