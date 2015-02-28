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
	has_many :updates
	
	has_one :auth_facebook, class_name: "User::Auth::Facebook", dependent: :destroy
	has_one :auth_symphian, class_name: "User::Auth::Symphian", dependent: :destroy
	has_one :auth_google, 	class_name: "User::Auth::Google", 	dependent: :destroy
	
	accepts_nested_attributes_for :auth_symphian
	
	has_and_belongs_to_many :genres

	has_one :youtube, dependent: :destroy
	
	attr_accessor :remember_token
	
	scope :starts_with, ->(name) { where("UPPER(name) like ?", "#{name.upcase}%") }
	
	#---------------Google auth --------------------
	
	def google_creds(auth)
		self.auth_google = Auth::Google.where(user: id).first_or_initialize do |goog|
			goog.token = auth.token
			goog.refresh_token = auth.refresh_token
			goog.expires_at = auth.expires_at
			goog.expires = auth.expires
		end
		save!
	end
	
	#-----------------Facebook Auth ----------------
	
	def self.from_omniauth(auth)
		
		#refactor to Auth::Facebook
			
			
		where(auth.info.slice(:email)).first_or_initialize.tap do |user|
			user.name = auth.info.name
			user.email = auth.info.email
			user.auth_facebook = Auth::Facebook.where(auth.slice(:uid)).first_or_initialize do |user_auth|
				user_auth.uid = auth.uid
				user_auth.oauth_token = auth.oauth_token
				user_auth.provider = auth.provider
			end
			user.pic = auth.info.image
			user.save!
		end
	end
	
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
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(token, cost: cost)
	end
	
	def remember
		self.remember_token = User.new_remember_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end
	
	def forget
		update_attribute(:remember_digest, nil)
	end
	
	def authenticated?(remember_token)
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
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