require 'test_helper'

class Customers::FoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_foods_index_url
    assert_response :success
  end

  test "should get show" do
    get customers_foods_show_url
    assert_response :success
  end

  test "should get new" do
    get customers_foods_new_url
    assert_response :success
  end

  test "should get create" do
    get customers_foods_create_url
    assert_response :success
  end

end
