require 'test_helper'

class Admins::FoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_foods_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_foods_show_url
    assert_response :success
  end

end
