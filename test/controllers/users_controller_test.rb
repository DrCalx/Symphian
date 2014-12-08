require "test_helper"

class UsersControllerTest < ActionController::TestCase
  def setup
    @user = users(:matt)
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "update invalid without signin" do
    patch :update, id: @user, user: { name: @user.name,
                                      email: @user.email }
    assert_not flash.empty?
    assert_redirected_to signin_url
  end
end