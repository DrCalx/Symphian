require 'test_helper'

class UserEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:matt)
  end
  
  test "bad edit" do
    get user_path(@user)
    patch user_path(@user), user: { name: " ",
                                    email: "bad@times.com",
                                    password: "onePass",
                                    password_confirmation: "twoPass" }
  end
  
  test "successful edit" do
    get user_path(@user)
    name = "John Smith"
    email = "john@smith.com"
    patch user_path(@user), user: { name: name, 
                                    email: email, 
                                    password:"", 
                                    password_confirmation:""}
    assert_redirected_to @user
    @user.reload
    assert_equal @user.name, name
    assert_equal @user.email, email
  end
end