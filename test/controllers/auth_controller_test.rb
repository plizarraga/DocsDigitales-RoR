require 'test_helper'

class AuthControllerTest < ActionController::TestCase
  test "should get singin" do
    get :singin
    assert_response :success
  end

  test "should get singup" do
    get :singup
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

end
