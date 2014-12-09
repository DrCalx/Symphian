require 'test_helper'

class SigninTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:matt)
  end
  
  test "signin with valid information" do
    post signin_path, session: {email: @user.email, password: 'Pass123'}
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
  end
end