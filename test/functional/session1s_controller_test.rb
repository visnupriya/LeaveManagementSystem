require 'test_helper'

class Session1sControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end
