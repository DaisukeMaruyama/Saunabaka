require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get favorites_create_url
    assert_response :success
  end

  test "should get destory" do
    get favorites_destory_url
    assert_response :success
  end

end
