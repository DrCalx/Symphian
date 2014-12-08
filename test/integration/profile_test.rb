require 'test_helper'

class ProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper
  
  def setup
    @user = users(:matt)
  end
  
  test "profile page display" do
    get user_path(@user)
    assert_template 'users/show'
  end
end