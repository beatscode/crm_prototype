require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    session[:username] = "admin"
    get :index
    assert_response :success
  end

  test "should get edit" do
    skip "need to rewrite"
    session[:username] = "admin"
    get :edit
    assert_response :success
  end

  test "should get show" do
    skip "need to rewrite"
    session[:username] = "admin"
    get(:show, {'id' => "12"})
    assert_response :success
  end

  test "should get create" do
    session[:username] = "admin"
    get :create
    assert_response :success
  end

end
