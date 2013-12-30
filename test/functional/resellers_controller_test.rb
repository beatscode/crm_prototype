require 'test_helper'

class ResellersControllerTest < ActionController::TestCase
   test "should get index" do
   	session[:username] = "admin"
    get :index
    assert_response :success
    assert_not_nil assigns(:resellers)
    assert_not_nil assigns(:sites)
  end

  test "should get new" do
    session[:username] = "admin"
    get :new
    assert_response :success
  end

  test "should get create" do
 	skip "Need to pass parameters"
    session[:username] = "admin"
    get :create
    assert_response :success
  end

  test "should get edit" do
 	skip "Need to pass parameters"
    session[:username] = "admin"
    get :edit
    assert_response :success
  end

  test "should get update" do
 	skip "Need to pass parameters"
    session[:username] = "admin"
    get :update
    assert_response :success
  end

  test "should get show" do
 	skip "Need to pass parameters"
    session[:username] = "admin"
    get :show
    assert_response :success
  end

end
