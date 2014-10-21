class AddZipToListing < ActiveRecord::Migration
  def change
    add_column :listings, :zip, :integer
    Listing.all.each do |l|
    	l.update_attribute(:zip, l.user.zip)
    end
  end
end
