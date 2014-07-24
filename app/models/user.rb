class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :name, 	presence: true, 
										length: { maximum: 50 }

	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #This isn't really good enough... but it'll do for now
	validates :email, presence: true, 
										format: { with: EMAIL_REGEX },
										uniqueness: { case_sensitive: false}

	has_many :memberships, dependent: :destroy
	has_many :groups, through: :memberships

	has_secure_password #Thanks Rails!
	validates :password, length: { minimum: 6 }

	def sign_with!(group)
		self.memberships.create!(group.id)
	end

	def signed_with?(group)
		self.memberships.find_by(group.id)
	end

	def unsign_with!(group)
		self.memberships.find_by(group.id).destroy
	end
end
