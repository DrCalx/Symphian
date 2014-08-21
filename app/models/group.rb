class Group < ActiveRecord::Base
	has_many :memberships, dependent: :destroy
	has_many :members, through: :memberships, source: :user

	def add_member!(user_id)
		self.memberships.create(user_id: user_id)
	end
end
