class Listing < ActiveRecord::Base
	belongs_to :listing_type
	
	belongs_to :user
end
