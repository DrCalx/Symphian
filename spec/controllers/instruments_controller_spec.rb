require 'test_helper'

class InstrumentsControllerTest < ActionController::TestCase
  test "should get selector" do
    get :selector
    assert_response :success
  end
end