require "test_helper"

class ApplicationHelperTest < ActionDispatch::IntegrationTest
  test "full title helper" do
    assert_equal full_title, "Symphian"
    assert_equal full_title('help'), "Symphian | help"
  end
end