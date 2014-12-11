require 'test_helper'

class ListingTest < ActiveSupport::TestCase
  def setup
    @type = listing_types(:rock)
    @user = users(:matt)
    @listing = @user.listings.build(listing_type: @type, description: "Test 123")
  end
  
  test "should be valid" do
    assert @listing.valid?
  end
  
  test "user id should be present" do
    @listing.user_id = nil
    assert_not @listing.valid?
  end
  
  test "description should be present" do
    @listing.description = "  "
    assert_not @listing.valid?
  end
  
  test "listing_type_id should be present" do
    @listing.listing_type_id = nil
    assert_not @listing.valid?
  end
  
  test "listings should come newest first" do
    assert_equal Listing.first, listings(:listing_rightnow)
  end
  
  #Test for max characters?
end