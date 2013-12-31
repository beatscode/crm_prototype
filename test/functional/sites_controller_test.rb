require 'test_helper'

class SitesControllerTest < ActionController::TestCase
 
 test "should get index" do
    session[:username] = "admin"
    get :index
    assert_response :success
  end

   test "should get a site" do
    session[:username] = "admin"
    get :show, {'id' => 1}
    assert_not_nil assigns(:pages)
    assert_not_nil assigns(:invoices)
    assert_not_nil assigns(:staff)
    assert_not_nil assigns(:doctors)
    assert_not_nil assigns(:domain)
    assert_not_nil assigns(:products)
    assert_response :success
  end

end