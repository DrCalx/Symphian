class User < ActiveRecord::Base
	has_many :memberships, dependent: :destroy
	has_many :groups, through: :memberships
end
