class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :name, 	presence: true, 
										length: { maximum: 50 }

	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #This isn't really good enough... but it'll do for now
	validates :email, presence: true, 
										format: { with: EMAIL_REGEX },
										uniqueness: true

	has_many :memberships, dependent: :destroy
	has_many :groups, through: :memberships

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
