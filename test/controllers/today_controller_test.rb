require 'test_helper'

class TodayControllerTest < ActionController::TestCase
  test "should get lists" do
    get :lists
    assert_response :success
  end

end
