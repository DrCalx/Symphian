class User < ActiveRecord::Base
	before_create { create_remember_token }
	before_save { self.email = email.downcase }
	validates :name, 	presence: true, 
										length: { maximum: 50 }

	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #This isn't really good enough... but it'll do for now
	validates :email, presence: true, 
										format: { with: EMAIL_REGEX },
										uniqueness: { case_sensitive: false}

	has_many :memberships, dependent: :destroy
	has_many :groups, through: :memberships

	has_many :user_played_instruments, dependent: :destroy
	has_many :instruments, through: :user_played_instruments

	has_many :listings, dependent: :destroy

	has_and_belongs_to_many :genres

	has_secure_password #Thanks Rails!
	validates :password, length: { minimum: 6 }, 
												on: :create

	has_one :youtube, dependent: :destroy
	

	#------------------ Groups ---------------------

	def sign_with!(group)
		self.memberships.create!(group_id: group.id)
	end

	def signed_with?(group)
		self.memberships.find_by(group)
	end

	def unsign_with!(group)
		self.memberships.find_by(group.id).destroy
	end

	#---------------- Instruments ---------------------
	
	def play!(instrument)
		user_played_instruments.create!(instrument_id: instrument.id)
	end

	def plays?(instrument)
		user_played_instruments.find_by(instrument_id: instrument.id)
	end

	#----------------- Session -------------------

	def User.new_remember_token
		SecureRandom.urlsafe_base64 #Create a random token as a cookie
	end

	def User.digest(token)
		Digest::SHA1.hexdigest(token.to_s) #Hash the token so no one can steal it from the db
	end

	#----------------Soundcloud------------
	
	SOUNDCLOUD_CLIENT_ID			= Settings.soundcloud_client_id
	SOUNDCLOUD_CLIENT_SECRET 	= Settings.soundcloud_client_secret

	def self.soundcloud_client(options = {})
		options = {
			:client_id 			=> SOUNDCLOUD_CLIENT_ID,
			:client_secret 	=> SOUNDCLOUD_CLIENT_SECRET
		}.merge(options)

		SoundCloud.new(options)
	end

	def soundcloud_client(options = {})
		options = {			
			:access_token 	=> soundcloud_access_token,
			:refresh_token 	=> soundcloud_refresh_token,
			:expires_at			=> soundcloud_expires_at,
		}.merge(options)

		client = self.class.soundcloud_client(options)

		client.on_exchange_token do
			self.update_attributes!({
				:soundcloud_access_token 	=> client.access_token,
				:soundcloud_refresh_token => client.refresh_token,
				:soundcloud_expires_at 		=> client.expires_at,
				})
		end

		return client
	end

	def embed_user_tracks
		soundcloud_client.get('/oembed', 
											:url => "http://soundcloud.com/#{soundcloud_username}/tracks", 
											:maxheight => 450)		
	end

	#---------------- Private ------------------


	private
		def create_remember_token
			self.remember_token = User.digest(User.new_remember_token)
		end
end