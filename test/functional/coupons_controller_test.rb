require 'test_helper'

class CouponsControllerTest < ActionController::TestCase

  test "should get index" do
    session[:username] = "admin"
    get :index
    assert_response :success
  end

  test "should get new" do
    skip "need to rewrite"
    session[:username] = "admin"
    get :new
    assert_response :success
  end


end
