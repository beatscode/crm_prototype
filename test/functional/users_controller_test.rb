require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    session[:username] = "admin"
    get :index
    assert_response :success
  end

  test "should get edit" do
    session[:username] = "admin"
    get(:edit, {'id' => 1 })
    assert_response :success
  end

  test "should get show" do
    session[:username] = "admin"
    get(:show, {'id' => 1})
    assert_response :success
  end

  test "should get create" do
    session[:username] = "admin"
    get :create
    assert_response :success
  end
  
  test "should update user" do
    session[:username] = "admin"
    post :update, { :user =>
                        {:login => 'testuser@mednet-tech.com', :id => 1 }
                    }
    assert_response :redirect
  end

end
