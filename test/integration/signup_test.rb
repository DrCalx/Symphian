require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: {  name: "",
                                email: "user@non.com",
                                password: "blank",
                                password_confirmation: "thing" }
    end
    assert_template 'users/new'
  end
  
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name: "Test User",
                                            email: "test@user.com",
                                            password: "test123",
                                            password_confirmation: "test123" }
    end
    assert_template 'users/show'
  end
end