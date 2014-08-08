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

	has_secure_password #Thanks Rails!
	validates :password, length: { minimum: 6 }

	#Groups

	def sign_with!(group)
		self.memberships.create!(group.id)
	end

	def signed_with?(group)
		self.memberships.find_by(group.id)
	end

	def unsign_with!(group)
		self.memberships.find_by(group.id).destroy
	end

	#Instruments
	def play!(instrument)
		user_played_instruments.create!(instrument_id: instrument.id)
	end

	def plays?(instrument)
		user_played_instruments.find_by(instrument_id: instrument.id)
	end

	#Session tokens
	def User.new_remember_token
		SecureRandom.urlsafe_base64 #Create a random token as a cookie
	end

	def User.digest(token)
		Digest::SHA1.hexdigest(token.to_s) #Hash the token so no one can steal it from the db
	end

	private
	def create_remember_token
		self.remember_token = User.digest(User.new_remember_token)
	end
end
