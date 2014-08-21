class Group < ActiveRecord::Base
	has_many :memberships, dependent: :destroy
	has_many :members, through: :memberships, source: :user

	def add_member!(user)
		self.memberships.create(user.id)
	end
end
