class User < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true
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
