class Listing < ActiveRecord::Base
	has_one :listing_type
	belongs_to :user
end
