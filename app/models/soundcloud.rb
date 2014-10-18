class Soundcloud
	def genre_player
		genre_names = genres.map{|n| n.name}.join(', ').downcase
		tracks = current_user.soundcloud_client.get('/tracks',  :genres => "rock")
		url = tracks.shuffle.first.permalink_url


		embed = current_user.soundcloud_client.get('/oembed', :url => "http://soundcloud.com/#{soundcloud_username}/tracks", :maxheight => 166)



		embed['html'].html_safe
	end
end