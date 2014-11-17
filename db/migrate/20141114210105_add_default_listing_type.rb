class AddDefaultListingType < ActiveRecord::Migration
  def change
  	Listing.all.each do |listing|
  		if listing.listing_type.nil?
  			listing.update_attribute(:listing_type, ListingType.find(1))
  		end
  	end
  end
end
