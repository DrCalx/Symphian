require 'test_helper'

class SigninTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:matt)
  end
  
  test "login with valid information" do
    get signin_path
    post signin_path, session: {email: @user.email, password: 'pass123'}
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
  end
end