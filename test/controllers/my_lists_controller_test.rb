require "test_helper"

class MyListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_lists_index_url
    assert_response :success
  end
end
