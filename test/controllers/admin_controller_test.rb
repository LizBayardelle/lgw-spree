require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get testimoniials" do
    get admin_testimoniials_url
    assert_response :success
  end

  test "should get blogs" do
    get admin_blogs_url
    assert_response :success
  end

  test "should get management" do
    get admin_management_url
    assert_response :success
  end

end
