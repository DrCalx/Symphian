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
  
  test "redirect listing destroy when not signed in" do
    assert_no_difference 'Listing.count' do
      delete :destroy, id: @listing.id
    end
    assert_redirected_to signin_url
  end
  
  test "cant destroy someone elses listing" do
    sign_in_as(users(:matt))
    other_listing = listings(:someone_elses_listing)
    assert_no_difference 'Listing.count' do
      delete :destroy, id:other_listing.id
    end
  end
end