class Listing < ActiveRecord::Base
	belongs_to :listing_type
	validates :listing_type, presence: true
	belongs_to :user
	validates :user_id, presence: true
	validates :description, presence: true
end
