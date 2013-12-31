require 'test_helper'

class CouponsControllerTest < ActionController::TestCase

  test "Should get coupon index page" do
    session[:username] = "admin"
    get :index
    assert_not_nil assigns(:coupons)
    assert_response :success
  end

  test "Should get new coupon page" do
    session[:username] = "admin"
    get :new
    assert_response :success
  end

  test "should test creating a new coupon" do
    session[:username] = "admin"
    
    post :create, { :coupon =>
                        {:name => 'test coupon 2', 
                         :code => 'testing2',
                         :discount => 20,
                         :discount_type => 1,
                         :start_date => '',
                         :end_date => ''
                          }
                      }
    assert_response :success
  end

  test "Deleting a coupon" do
    session[:username] = "admin"
    post :delete, {:id => 1}
    assert_not_nil assigns(:coupon)
    assert_response :redirect  
  end

  test "Loading coupon edit page" do
    session[:username] = "admin"
    get :edit, {:id => 1}
    assert_not_nil assigns(:coupon)
    assert_response :success  
  end

  test "Updating a coupon" do
    session[:username] = "admin"
    post :updateCoupon, { :coupon =>
                        {:id => 1,
                          :name => 'test coupon 2', 
                         :code => 'testing2',
                         :discount => 20,
                         :discount_type => 1,
                         :start_date => '',
                         :end_date => ''
                          }
                      }
    assert_response :redirect
  end


end
