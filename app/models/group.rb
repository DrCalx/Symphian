class Group < ActiveRecord::Base
	has_many :memberships, dependent: :destroy
	has_many :members, through: :memberships, source: :user
	has_many :updates, dependent:destroy

	has_many :openings, dependent: :destroy

	has_and_belongs_to_many :genres

	def add_member!(user_id)
		self.memberships.create(user_id: user_id)
	end
end
