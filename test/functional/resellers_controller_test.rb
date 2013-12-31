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

  test "should get edit" do
    session[:username] = "admin"
    get(:edit, {'id' => 8})
    assert_response :success
  end
  
  test "should get create" do
    session[:username] = "admin"
    
    post :create, { :reseller =>
                        {:name => 'test', :marketing_type => '' }
                      }
    assert_response :redirect
  end
  
  test "should get show" do
    session[:username] = "admin"
    get :show, { :id =>  8}
    assert_not_nil assigns(:reseller)
    assert_not_nil assigns(:users)
    assert_not_nil assigns(:usercount)
    assert_not_nil assigns(:sites)  
    assert_not_nil assigns(:invoices) 
    assert_not_nil assigns(:user_logins) 
    assert_response :success
  end

end
