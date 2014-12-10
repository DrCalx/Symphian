require 'test_helper'

class ListingsControllerTest < ActionController::TestCase
  def setup
    @listing = listings(:listing_old)
  end
  
  test "redirect when not signed in" do
    assert_no_difference 'Listing.count' do
      post :create, listing: {content: "Hot new content"}
    end
    assert_redirected_to signin_url 
  end
end