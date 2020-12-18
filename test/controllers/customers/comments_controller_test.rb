require 'test_helper'

class Customers::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get customers_comments_create_url
    assert_response :success
  end
end
