require 'test_helper'

class BusRoutesControllerTest < ActionController::TestCase
  test "should get show_times" do
    get :show_times
    assert_response :success
  end

  test "should get show_map" do
    get :show_map
    assert_response :success
  end

end
